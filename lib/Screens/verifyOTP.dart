import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karry_go/Screens/SignUp%20Screens/address.dart';
import 'package:karry_go/Screens/SignUp%20Screens/main.dart';
import 'package:karry_go/Screens/mainScreen.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/utils/databasemethods.dart';
import 'package:karry_go/utils/utils.dart';

class VerifyOTP extends StatefulWidget {
  VerifyOTP({
    Key? key,
    required this.phoneNumber,
    required this.codeTimeOut,
    required this.phoneLogin,
    required this.userInfoMap,
  }) : super(key: key);

  final String phoneNumber;
  final int codeTimeOut;
  Map<String, dynamic> userInfoMap;
  final bool phoneLogin;

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  Timer? countdownTimer;
  late Duration myDuration;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    myDuration = Duration(seconds: widget.codeTimeOut);
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() {
      countdownTimer!.cancel();
    });
  }

  Future<void> resetTimer() async {
    stopTimer();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      timeout: Duration(seconds: widget.codeTimeOut),
      verificationFailed: (FirebaseAuthException e) {
        print("Something went Wrong");
      },
      codeSent: (String verificationId, int? resendToken) {
        SignUp.verify = verificationId;
        setState(() {
          myDuration = Duration(seconds: widget.codeTimeOut);
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future verify(Size size) async {
    code = "${one + two + three + four + five + six}";
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

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: SignUp.verify, smsCode: code);

      await auth.signInWithCredential(credential);

      if (widget.phoneLogin) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MainScreen();
            },
          ),
        );
      } else {
        DatabaseMethods().addUserInfoDB(
            FirebaseAuth.instance.currentUser!.uid, widget.userInfoMap);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Address();
            },
          ),
        );
      }
    } catch (e) {
      Utils.showSnackBar("Worng OTP", size);
    }
  }

  String one = "";
  String two = "";
  String three = "";
  String four = "";
  String five = "";
  String six = "";
  String code = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String strDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Scaffold(
      body: Container(
        width: size.width * 1,
        height: size.height * 1,
        color: AppColors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.08,
                  vertical: MediaQuery.of(context).padding.top),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: size.height * 0.045,
                  ),
                  Text(
                    "Verify OTP",
                    style: TextStyle(
                      fontSize: 22,
                      color: AppColors.black,
                      fontFamily: "Clash Grotesk SemiBold",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Text(
                    "A six digit OTP has been sent to your registered email, please check email to verify 📮",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.3,
                      color: AppColors.subBlack,
                      fontFamily: "DM Sans",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: size.height * 0.053,
                          width: size.width * 0.115,
                          child: Center(
                            child: TextFormField(
                              onSaved: (pin1) {},
                              onChanged: (value) {
                                one = value;
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              autofocus: true,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: AppColors.green, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: AppColors.subWhite, width: 2.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: size.height * 0.01),
                                hintText: "0",
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "DM Sans",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.subWhite,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "DM Sans",
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.053,
                          width: size.width * 0.115,
                          child: TextFormField(
                            onSaved: (pin2) {},
                            onChanged: (value) {
                              two = value;
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColors.green, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColors.subWhite, width: 2.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.height * 0.01),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "0",
                              hintStyle: TextStyle(
                                fontFamily: "DM Sans",
                                fontWeight: FontWeight.w400,
                                color: AppColors.subWhite,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: TextStyle(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.053,
                          width: size.width * 0.115,
                          child: TextFormField(
                            onSaved: (pin3) {},
                            onChanged: (value) {
                              three = value;
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColors.green, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColors.subWhite, width: 2.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.height * 0.01),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "0",
                              hintStyle: TextStyle(
                                fontFamily: "DM Sans",
                                fontWeight: FontWeight.w400,
                                color: AppColors.subWhite,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: TextStyle(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.053,
                          width: size.width * 0.115,
                          child: TextFormField(
                            onSaved: (pin4) {},
                            onChanged: (value) {
                              four = value;
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColors.green, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColors.subWhite, width: 2.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.height * 0.01),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "0",
                              hintStyle: TextStyle(
                                fontFamily: "DM Sans",
                                fontWeight: FontWeight.w400,
                                color: AppColors.subWhite,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: TextStyle(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.053,
                          width: size.width * 0.115,
                          child: TextFormField(
                            onSaved: (pin5) {},
                            onChanged: (value) {
                              five = value;
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColors.green, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColors.subWhite, width: 2.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.height * 0.01),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "0",
                              hintStyle: TextStyle(
                                fontFamily: "DM Sans",
                                fontWeight: FontWeight.w400,
                                color: AppColors.subWhite,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: TextStyle(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.053,
                          width: size.width * 0.115,
                          child: TextFormField(
                            onSaved: (pin6) {},
                            onChanged: (value) {
                              six = value;
                              if (value.length == 1) {
                                FocusScope.of(context).unfocus();
                              }
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColors.green, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppColors.subWhite, width: 2.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: size.height * 0.01),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "0",
                              hintStyle: TextStyle(
                                fontFamily: "DM Sans",
                                fontWeight: FontWeight.w400,
                                color: AppColors.subWhite,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: TextStyle(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                                text: "Expires in ",
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                              text: "$minutes:$seconds",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      TextButton(
                        onPressed: resetTimer,
                        child: Text(
                          "Resend OTP",
                          style: TextStyle(
                            fontFamily: "DM Sans",
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                            color: AppColors.green,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(30, 10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.055,
                  ),
                  GestureDetector(
                    onTap: () {
                      verify(size);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width * 0.84,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.black,
                      ),
                      child: const Text(
                        "Verify OTP",
                        style: TextStyle(
                          fontFamily: "DM Sans",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
