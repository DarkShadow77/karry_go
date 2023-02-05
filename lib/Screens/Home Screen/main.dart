import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:karry_go/utils/bitmapDescriptorFromSvgAsset.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/utils/databasemethods.dart';
import 'package:location/location.dart';

const LatLng currentLocation = LatLng(25.1193, 55.3773);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<GoogleMapController> _controller = Completer();

  bool online = false;

  LocationData? currentLocation;

  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    getCurrentLocation();
    setCustomMarkerIcon();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((location) {
      setState(() {
        currentLocation = location;
      });
    });

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 13.5,
            target: LatLng(newLoc.latitude!, newLoc.longitude!),
          ),
        ),
      );
    });
  }

  void setCustomMarkerIcon() async {
    currentIcon = await BitmapDescriptorHelper.getBitmapDescriptorFromSvgAsset(
        context, "assets/svg/Taxi.svg");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _liveLocation =
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
    return FutureBuilder(
      future: DatabaseMethods()
          .getUserFromDB(FirebaseAuth.instance.currentUser!.uid),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Container(
            width: size.width * 1,
            child: Stack(
              children: [
                Container(
                  width: size.width * 1,
                  height: size.height * 1,
                  child: Stack(
                    children: [
                      currentLocation == null
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: AppColors.subWhite2,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("Loading")
                                ],
                              ),
                            )
                          : GoogleMap(
                              buildingsEnabled: true,
                              trafficEnabled: true,
                              initialCameraPosition: CameraPosition(
                                zoom: 13.5,
                                target: _liveLocation,
                              ),
                              onMapCreated: (mapController) {
                                _controller.complete(mapController);
                              },
                              markers: {
                                Marker(
                                  markerId: const MarkerId("currentLocation"),
                                  icon: currentIcon,
                                  position: _liveLocation,
                                ),
                              },
                            ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: size.width * 0.84,
                          height: size.height * 0.096,
                          margin:
                              EdgeInsets.only(bottom: size.height * 0.13775),
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.0515,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.black,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "DM Sans",
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: online
                                                ? "You’re Online"
                                                : "You’re Offline",
                                          )
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "DM Sans",
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: online
                                                ? "Requests will appear in a bit"
                                                : "Come online to see requests",
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    online = !online;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  width: size.width * 0.2,
                                  height: size.height * 0.038,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        online ? AppColors.red : AppColors.blue,
                                  ),
                                  child: Center(
                                    child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "DM Sans",
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: online
                                                ? "Go offline"
                                                : "Let’s Go",
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.16,
                  child: CustomScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        elevation: 0,
                        toolbarHeight: size.height * 0.11135,
                        automaticallyImplyLeading: false,
                        floating: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(30),
                          ),
                        ),
                        backgroundColor: AppColors.white,
                        stretch: true,
                        title: Container(
                          width: size.width * 1,
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.04,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    RichText(
                                      softWrap: true,
                                      text: TextSpan(
                                        text: "Hey " + data["firstName"],
                                        style: TextStyle(
                                          fontFamily: "Clash Grotesk SemiBold",
                                          fontSize: 20,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.005,
                                    ),
                                    RichText(
                                      softWrap: true,
                                      text: TextSpan(
                                        text: "Today is looking positive 😊",
                                        style: TextStyle(
                                          fontFamily: "DM Sans",
                                          fontSize: 13,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01185,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  RichText(
                                    softWrap: true,
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontFamily: "DM Sans",
                                        fontSize: 12,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w400,
                                      ), //apply style to all
                                      children: [
                                        TextSpan(
                                          text: "Kárry",
                                          style: TextStyle(
                                            color: AppColors.black,
                                            fontFamily:
                                                "Clash Grotesk SemiBold",
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Go",
                                          style: TextStyle(
                                            fontFamily: "Space Grotesk",
                                            color: Color(0xff27ae60),
                                          ),
                                        ),
                                        TextSpan(
                                          text: " Balance",
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      width: size.width * 0.2898,
                                      height: size.height * 0.038,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.black,
                                      ),
                                      child: Center(
                                        child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          text: TextSpan(
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            children: [
                                              /*TextSpan(
                                          text: getCurrency(),
                                        ),*/
                                              TextSpan(
                                                text: "173,000.00",
                                                style: TextStyle(
                                                  fontFamily: "DM Sans",
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      /*SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: size.width * 0.84,
                          height: size.height * 0.096,
                          margin: EdgeInsets.only(bottom: size.height * 0.13775),
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.0515,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.black,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "DM Sans",
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "You’re Online",
                                          )
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "DM Sans",
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "Requests will appear in a bit",
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    online = !online;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  width: size.width * 0.2,
                                  height: size.height * 0.038,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        online ? AppColors.red : AppColors.blue,
                                  ),
                                  child: Center(
                                    child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "DM Sans",
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: online
                                                ? "Go offline"
                                                : "Let’s Go",
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )*/
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.green,
            ),
          );
        }
      },
    );
  }
}
