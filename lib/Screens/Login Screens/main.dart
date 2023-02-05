import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:karry_go/Screens/Login%20Screens/forgotPassword.dart';
import 'package:karry_go/Screens/SignUp%20Screens/main.dart';
import 'package:karry_go/Screens/mainScreen.dart';
import 'package:karry_go/Screens/verifyOTP.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/utils/utils.dart';
import 'package:karry_go/widgets/TextField.dart';
import 'package:karry_go/widgets/fadeInDown.dart';
import 'package:karry_go/widgets/logo.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  bool phoneNumberBool = false;

  bool emailBool = false;
  bool passBool = false;
  bool phoneBool = false;
  String email = "";
  String password = "";
  String phoneNumber = "";

  String dialCode = "";

  Future signInEmail(Size size) async {
    email = emailController.text.trim();
    password = passwordController.text.trim();
    password = passwordController.text.trim();

    setState(() {
      emailBool = !EmailValidator.validate(email) ? true : false;
      passBool = password.length < 10 ? true : false;
    });
    if (emailBool == false && password == false) {
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

        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MainScreen();
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

  Future signInPhone(Size size) async {
    phoneNumber = "${dialCode + phoneController.text.trim()}";

    print(phoneNumber);

    int codeTimeOut = 80;

    setState(() {
      phoneBool = phoneNumber.length < 10 ? true : false;
    });
    if (phoneBool == false) {
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
              Navigator.of(context).pop();
              print('The provided phone number is not valid.');
              Utils.showSnackBar(
                  "The provided phone number is not valid.", size);
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
                    userInfoMap: {},
                    phoneLogin: true,
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
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          width: size.width * 1,
          height: size.height * 1,
          color: AppColors.black,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.09,
                    vertical: MediaQuery.of(context).padding.top),
                height: size.height * 0.87,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: size.height * 0.135,
                    ),
                    FadeInDowns(
                      seconds: 1000,
                      child: Logo(
                        color: Colors.white,
                        position: MainAxisAlignment.start,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    FadeInDowns(
                      seconds: 1200,
                      child: RichText(
                        text: TextSpan(
                          text: "Welcome Back!",
                          style: TextStyle(
                            fontSize: 24,
                            color: AppColors.black,
                            fontFamily: "Clash Grotesk SemiBold",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    FadeInDowns(
                      seconds: 1400,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: size.width * 0.19,
                        ),
                        child: RichText(
                          text: TextSpan(
                            text:
                                "It’s a good day to drive, let’s help you make some money 🤑",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.subBlack,
                              fontFamily: "DM Sans",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.023,
                    ),
                    Container(
                      child: phoneNumberBool
                          ? Container(
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
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber value) {
                                  int phoneLength =
                                      value.phoneNumber.toString().length;
                                  dialCode = value.dialCode.toString();

                                  setState(() {
                                    phoneBool = phoneLength < 14 ? true : false;
                                  });
                                },
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
                            )
                          : EmailLogin(
                              emailBool: emailBool,
                              emailController: emailController,
                              size: size,
                              passBool: passBool,
                              passwordController: passwordController),
                    ),
                    SizedBox(
                      height: size.height * 0.023,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              phoneNumberBool = !phoneNumberBool;
                            });
                          },
                          child: Text(
                            phoneNumberBool
                                ? "Use Email?"
                                : "Use Phone Number?",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.green,
                              fontFamily: "DM Sans",
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ForgotPassword();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Forgot password?",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.green,
                              fontFamily: "DM Sans",
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.12,
                    ),
                    GestureDetector(
                      onTap: () {
                        phoneNumberBool ? signInPhone(size) : signInEmail(size);
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
                          "Sign In",
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
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    softWrap: true,
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        fontFamily: "DM Sans",
                        fontSize: 12,
                        color: AppColors.white,
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
                            return SignUp();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Get Started",
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
      ),
    );
  }
}

class PhoneNumberLogin extends StatefulWidget {
  PhoneNumberLogin(
      {Key? key,
      required this.size,
      required this.phoneBool,
      required this.phoneController,
      required this.dialCode})
      : super(key: key);

  final Size size;
  bool phoneBool;
  final TextEditingController phoneController;
  String dialCode;

  @override
  State<PhoneNumberLogin> createState() => _PhoneNumberLoginState();
}

class _PhoneNumberLoginState extends State<PhoneNumberLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: widget.phoneBool ? Colors.red : AppColors.subWhite2,
            width: 1.0),
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber value) {
          int phoneLength = value.phoneNumber.toString().length;
          widget.dialCode = value.dialCode.toString();

          setState(() {
            widget.phoneBool = phoneLength < 14 ? true : false;
          });
        },
        textFieldController: widget.phoneController,
        initialValue: PhoneNumber(
          isoCode: "NG",
        ),
        cursorColor: AppColors.subWhite,
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
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
    );
  }
}

class EmailLogin extends StatelessWidget {
  const EmailLogin({
    Key? key,
    required this.emailBool,
    required this.emailController,
    required this.size,
    required this.passBool,
    required this.passwordController,
  }) : super(key: key);

  final bool emailBool;
  final TextEditingController emailController;
  final Size size;
  final bool passBool;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldEmail(
          fieldBool: emailBool,
          controller: emailController,
          hintText: "Email",
          textInputAction: TextInputAction.next,
          warningMessage: "Enter a Valid Email",
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        TextFieldText(
          fieldBool: passBool,
          controller: passwordController,
          hintText: "Password",
          textInputAction: TextInputAction.done,
          warningMessage: "Enter a Valid password",
        ),
      ],
    );
  }
}
