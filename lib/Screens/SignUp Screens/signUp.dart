import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:karry_go/Screens/Login%20Screens/login.dart';
import 'package:karry_go/Screens/verifyOTP.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/utils/utils.dart';
import 'package:karry_go/widgets/TextField.dart';
import 'package:karry_go/widgets/fadeInDown.dart';
import 'package:karry_go/widgets/logo.dart';
import 'package:karry_go/widgets/signUpBars.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  final formKeys = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final referralController = TextEditingController();

  String password = '';
  String dialCode = "";

  bool firstBool = false;
  bool lastBool = false;
  bool emailBool = false;
  bool phoneBool = false;

  String firstName = "";
  String lastName = "";
  String email = "";
  String phoneNumber = "";
  String referral = "";

  Future signUp(Size size) async {
    firstName = firstNameController.text.trim();
    lastName = lastNameController.text.trim();
    email = emailController.text.trim();
    phoneNumber = "${dialCode + phoneController.text.trim()}";
    referral = referralController.text.trim();

    int codeTimeOut = 80;
    print(phoneNumber);

    setState(() {
      firstBool = firstName.length < 2 ? true : false;
      lastBool = lastName.length < 2 ? true : false;
      emailBool = !EmailValidator.validate(email) ? true : false;
      phoneBool = phoneNumber.length < 10 ? true : false;
    });
    if (firstBool == false &&
        lastBool == false &&
        emailBool == false &&
        phoneBool == false) {
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

        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {},
          timeout: Duration(seconds: codeTimeOut),
          verificationFailed: (FirebaseAuthException e) {
            if (e.code == 'invalid-phone-number') {
              print('The provided phone number is not valid.');
            }
          },
          codeSent: (String verificationId, int? resendToken) {
            SignUp.verify = verificationId;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return VerifyOTP(
                    codeTimeOut: codeTimeOut,
                    phoneNumber: phoneNumber,
                    userInfoMap: {
                      "firstName": firstNameController.text.trim(),
                      "lastName": lastNameController.text.trim(),
                      "email": emailController.text.trim(),
                      "phoneNumber": phoneController.text.trim(),
                      "referral": referralController.text.trim(),
                      "address": "",
                      "country": "",
                      "state": "",
                      "city": "",
                    },
                  );
                },
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
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
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    referralController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                            text: TextSpan(
                              text: "Get Started!",
                              style: TextStyle(
                                fontSize: 24,
                                color: AppColors.black,
                                fontFamily: "Clash Grotesk",
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
                              style: TextStyle(
                                fontFamily: "DM Sans",
                                fontSize: 12,
                                height: 1.7,
                                color: AppColors.subBlack,
                                fontWeight: FontWeight.w400,
                              ), //apply style to all
                              children: [
                                TextSpan(
                                  text: "Let's get your ",
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
                                  text: " driver account started in",
                                ),
                                TextSpan(
                                  text: " 5",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      " easy steps. Start by putting in some basic information 😉",
                                ),
                              ],
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
                      color1: AppColors.greenBar.withOpacity(0.38),
                      color2: AppColors.subWhite2,
                      color3: AppColors.subWhite2,
                      color4: AppColors.subWhite2,
                      color5: AppColors.subWhite2,
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFieldText(
                            fieldBool: firstBool,
                            controller: firstNameController,
                            hintText: "First Name",
                            textInputAction: TextInputAction.next,
                            warningMessage: "Enter a Valid First Name",
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                          TextFieldText(
                            fieldBool: lastBool,
                            controller: lastNameController,
                            hintText: "Last Name",
                            textInputAction: TextInputAction.next,
                            warningMessage: "Enter a Valid Last Name",
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                          TextFieldEmail(
                            fieldBool: emailBool,
                            controller: emailController,
                            hintText: "Email",
                            textInputAction: TextInputAction.next,
                            warningMessage: "Enter a Valid Email",
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: phoneBool
                                      ? Colors.red
                                      : AppColors.subWhite2,
                                  width: 1.0),
                            ),
                            child: Stack(
                              children: [
                                InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber value) {
                                    int phoneLength =
                                        value.phoneNumber.toString().length;
                                    dialCode = value.dialCode.toString();

                                    setState(() {
                                      phoneBool =
                                          phoneLength < 14 ? true : false;
                                    });
                                  },
                                  fieldKey: formKeys,
                                  textFieldController: phoneController,
                                  initialValue: PhoneNumber(
                                    isoCode: "NG",
                                  ),
                                  cursorColor: AppColors.subWhite,
                                  selectorConfig: SelectorConfig(
                                    selectorType:
                                        PhoneInputSelectorType.BOTTOM_SHEET,
                                    setSelectorButtonAsPrefixIcon: true,
                                  ),
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.subWhite,
                                  ),
                                  inputDecoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "DM Sans",
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.subWhite,
                                    ),
                                  ),
                                  maxLength: 12,
                                  searchBoxDecoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: AppColors.green,
                                        width: 1.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: AppColors.subWhite2,
                                        width: 1.0,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(14),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "DM Sans",
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.subWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                          TextFieldText(
                            fieldBool: false,
                            controller: referralController,
                            hintText: "Referral Code (Optional)",
                            textInputAction: TextInputAction.done,
                          ),
                          SizedBox(
                            height: size.height * 0.016,
                          ),
                        ],
                      ),
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
                      height: size.height * 0.016,
                    ),
                    GestureDetector(
                      onTap: () {
                        signUp(size);
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
                      height: size.height * 0.04,
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
                            text: "By proceeding, you agree to ",
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
                            text: " Terms of Use",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: AppColors.blue,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: " and acknowledge to follow the ",
                          ),
                          TextSpan(
                            text: " Privacy Policy.",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: AppColors.blue,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                          text: TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                              fontFamily: "DM Sans",
                              fontSize: 12,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Login();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Sign In",
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
