import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:karry_go/Screens/Login%20Screens/forgotPassword.dart';
import 'package:karry_go/Screens/SignUp%20Screens/signUp.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/utils/utils.dart';
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

  Future signIn(Size size) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message, size);
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
      body: Container(
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
                    child: Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 26,
                        color: AppColors.black,
                        fontFamily: "Clash Grotesk SemiBold",
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
                      child: Text(
                        "It’s a good day to drive, let’s help you make some money 🤑",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.subBlack,
                          fontFamily: "DM Sans",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.023,
                  ),
                  TextField(
                    controller: emailController,
                    cursorColor: AppColors.subWhite,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppColors.green, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppColors.subWhite, width: 2.0),
                      ),
                      contentPadding: EdgeInsets.all(14),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "DM Sans",
                        fontWeight: FontWeight.w400,
                        color: AppColors.subWhite,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.subWhite,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  TextField(
                    obscureText: true,
                    controller: passwordController,
                    cursorColor: AppColors.subWhite,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppColors.green, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppColors.subWhite, width: 2.0),
                      ),
                      contentPadding: EdgeInsets.all(14),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "DM Sans",
                        fontWeight: FontWeight.w400,
                        color: AppColors.subWhite,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility_off_outlined,
                        color: Color(0xffe0e0e0),
                        size: 16,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.subWhite,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.023,
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
                  SizedBox(
                    height: size.height * 0.12,
                  ),
                  GestureDetector(
                    onTap: () {},
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
    );
  }
}
