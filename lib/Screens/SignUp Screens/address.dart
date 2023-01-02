import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:karry_go/Screens/SignUp%20Screens/documents.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/utils/utils.dart';
import 'package:karry_go/widgets/TextField.dart';
import 'package:karry_go/widgets/fadeInDown.dart';
import 'package:karry_go/widgets/logo.dart';
import 'package:karry_go/widgets/signUpBars.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  void initState() {
    super.initState();
  }

  final addressController = TextEditingController();

  String countryValue = "Country";
  String stateValue = "State";
  String cityValue = "City";

  bool addressBool = false;
  bool countryBool = false;
  bool stateBool = false;
  bool cityBool = false;

  Future next(Size size) async {
    String address = addressController.text.trim();

    setState(() {
      addressBool = address.length < 10 ? true : false;
      countryBool = countryValue == "null" ? true : false;
      stateBool = stateValue == "null" ? true : false;
      cityBool = cityValue == "null" ? true : false;
    });

    if (addressBool == false &&
        countryBool == false &&
        stateBool == false &&
        cityBool == false) {
      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(
            child: CircularProgressIndicator(
              color: AppColors.green,
            ),
          ),
        );

        Map<String, dynamic> userInfoMap = {
          "address": address,
          "country": countryValue,
          "state": stateValue,
          "city": cityValue,
        };

        FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(userInfoMap);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Documents();
            },
          ),
        );
      } on FirebaseAuthException catch (e) {
        print(e);

        Utils.showSnackBar(e.message, size);
      }
    } else {
      Utils.showSnackBar("Please Fill All Required Fields", size);
    }
  }

  @override
  void dispose() {
    addressController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 1,
          height: size.height * 1,
          color: AppColors.white,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.08,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: size.height * 0.055,
                    ),
                    FadeInDowns(
                      seconds: 1000,
                      child: const Logo(
                        color: Colors.white,
                        position: MainAxisAlignment.start,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    FadeInDowns(
                      seconds: 1200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          RichText(
                            softWrap: true,
                            text: TextSpan(
                              text: "Address Info",
                              style: TextStyle(
                                fontFamily: "Clash Grotesk",
                                fontSize: 24,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          RichText(
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            softWrap: true,
                            text: TextSpan(
                              text:
                                  "We need your residential address information for legal reasons. This should not take long 🏠",
                              style: TextStyle(
                                fontFamily: "DM Sans",
                                fontSize: 12,
                                height: 1.7,
                                color: AppColors.subBlack,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SignUpBars(
                      size: size,
                      color1: AppColors.greenBar,
                      color2: AppColors.greenBar.withOpacity(0.38),
                      color3: AppColors.subWhite2,
                      color4: AppColors.subWhite2,
                      color5: AppColors.subWhite2,
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Form(
                      child: Column(
                        children: [
                          TextFieldText(
                            fieldBool: addressBool,
                            controller: addressController,
                            hintText: "Address",
                            textInputAction: TextInputAction.next,
                            warningMessage: "Enter a min. 10 Characters",
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                          CSCPicker(
                            size: size,
                            showStates: true,
                            showCities: true,
                            flagState: CountryFlag.ENABLE,
                            countryDecoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.white,
                              border: Border.all(
                                  color: countryBool
                                      ? Colors.red
                                      : AppColors.subWhite2,
                                  width: 2),
                            ),
                            stateDecoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.white,
                              border: Border.all(
                                  color: stateBool
                                      ? Colors.red
                                      : AppColors.subWhite2,
                                  width: 2),
                            ),
                            cityDecoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.white,
                              border: Border.all(
                                  color: cityBool
                                      ? Colors.red
                                      : AppColors.subWhite2,
                                  width: 2),
                            ),
                            countryDisabledDecoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.grey.shade300,
                              border: Border.all(
                                  color: countryBool
                                      ? Colors.red
                                      : AppColors.subWhite2,
                                  width: 2),
                            ),
                            stateDisabledDecoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.grey.shade300,
                              border: Border.all(
                                  color: stateBool
                                      ? Colors.red
                                      : AppColors.subWhite,
                                  width: 2),
                            ),
                            cityDisabledDecoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.grey.shade300,
                              border: Border.all(
                                  color: cityBool
                                      ? Colors.red
                                      : AppColors.subWhite,
                                  width: 2),
                            ),

                            ///placeholders for dropdown search field
                            countrySearchPlaceholder: "Country",
                            stateSearchPlaceholder: "State",
                            citySearchPlaceholder: "City",

                            ///labels for dropdown
                            countryDropdownLabel: "Country",
                            stateDropdownLabel: "State",
                            cityDropdownLabel: "City",

                            defaultCountry: DefaultCountry.Nigeria,
                            selectedItemStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: "DM Sans",
                              fontWeight: FontWeight.w400,
                              color: AppColors.subWhite,
                            ),
                            dropdownHeadingStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: "DM Sans",
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                            dropdownItemStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: "DM Sans",
                              fontWeight: FontWeight.bold,
                              color: AppColors.subWhite,
                            ),

                            dropdownDialogRadius: 20.0,
                            searchBarRadius: 10.0,
                            layout: Layout.vertical,

                            onCountryChanged: (value) {
                              setState(() {
                                countryValue = value;
                                countryBool =
                                    countryValue == "null" || countryValue == ""
                                        ? true
                                        : false;
                              });
                            },
                            onStateChanged: (value) {
                              setState(() {
                                stateValue = value.toString();
                                stateBool =
                                    stateValue == "null" || stateValue == ""
                                        ? true
                                        : false;
                              });
                            },
                            onCityChanged: (value) {
                              setState(() {
                                cityValue = value.toString();

                                cityBool =
                                    cityValue == "null" || cityValue == ""
                                        ? true
                                        : false;
                              });
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.15,
                    ),
                  ],
                ),
              ),
              Divider(
                color: AppColors.subWhite2,
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.08,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        next(size);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width * 0.84,
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff000000).withOpacity(0.22),
                              blurRadius: 12,
                              spreadRadius: -7,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Text(
                          "Next Step",
                          style: TextStyle(
                            fontFamily: "DM Sans",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      maxLines: 2,
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
                            text: "All ",
                          ),
                          TextSpan(
                            text: "Kárry",
                            style: TextStyle(
                              color: AppColors.black,
                              fontFamily: "Clash Grotesk SemiBold",
                            ),
                          ),
                          TextSpan(
                            text: "Go",
                            style: TextStyle(
                              fontFamily: "Space Grotesk",
                              color: AppColors.green,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: " drivers' information are kept private",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
