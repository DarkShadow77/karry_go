import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karry_go/Screens/Trips%20Screen/trip_slide.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/widgets/tabs.dart';

class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 1,
      child: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            toolbarHeight: size.height * 0.11135,
            automaticallyImplyLeading: false,
            floating: true,
            backgroundColor: AppColors.white,
            stretch: true,
            title: Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.07,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: size.height * 0.03555,
                  ),
                  RichText(
                    softWrap: true,
                    text: TextSpan(
                      text: "Trips",
                      style: TextStyle(
                        fontFamily: "Clash Grotesk SemiBold",
                        fontSize: 24,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        softWrap: true,
                        text: TextSpan(
                          text: "All your trip history will appear here",
                          style: TextStyle(
                            fontFamily: "DM Sans",
                            fontSize: 13,
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/svg/calendarsearch.svg",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01185,
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            TripSlide(
                              first: true,
                              size: size,
                              image: "assets/images/car.png",
                              subTitle: 'total trips',
                              unit: "2,231",
                              unitSub: "trips",
                              color: AppColors.trip1,
                            ),
                            TripSlide(
                              size: size,
                              image: "assets/images/chart.png",
                              subTitle: 'daily average',
                              unit: "27",
                              unitSub: "trips",
                              color: AppColors.trip2,
                            ),
                            TripSlide(
                              size: size,
                              third: true,
                              image: "assets/images/cash.png",
                              subTitle: 'trip earnings',
                              unit: "390,000",
                              color: AppColors.trip3,
                            ),
                            TripSlide(
                              last: true,
                              size: size,
                              image: "assets/images/hour_glass.png",
                              subTitle: 'time online',
                              unit: "332",
                              unitSub: "days",
                              color: AppColors.trip4,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                        ),
                        child: DefaultTabController(
                          length: 3,
                          child: Tabs(
                            size: size,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
