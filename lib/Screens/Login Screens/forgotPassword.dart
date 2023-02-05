import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karry_go/Screens/Login%20Screens/main.dart';
import 'package:karry_go/Screens/Login%20Screens/resetPassword.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/widgets/logo.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  void initState() {
    super.initState();
  }

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
              height: size.height * 0.88,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: size.height * 0.045,
                  ),
                  const Logo(
                    color: Colors.white,
                    position: MainAxisAlignment.start,
                  ),
                  Container(
                    height: size.height * 0.385,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/Forgotpassword.png",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Forgot Password?",
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.black,
                        fontFamily: "Clash Grotesk SemiBold",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          "A six digit OTP will be sent to your registered email, please type in your email and check mail to confirm 📮",
                      style: TextStyle(
                        fontSize: 12,
                        height: 2,
                        color: AppColors.subBlack,
                        fontFamily: "DM Sans",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.023,
                  ),
                  TextField(
                    controller: emailController,
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
                      contentPadding: const EdgeInsets.all(14),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter Email",
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ResetPassword();
                          },
                        ),
                      );
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
                        "Send OTP",
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
                    text: "Remember Password?",
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
    );
  }
}
