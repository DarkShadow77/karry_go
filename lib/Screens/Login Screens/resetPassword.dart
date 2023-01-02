import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karry_go/Screens/Login%20Screens/login.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/widgets/logo.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  void initState() {
    super.initState();
  }

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    confirmPasswordController.dispose();
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
        color: AppColors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.09,
                  vertical: MediaQuery.of(context).padding.top),
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
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Reset Password",
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.black,
                        fontFamily: "Clash Groteskd",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Text(
                    "We advice that you use a password that is easy to remember but difficult to predict",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      height: 2,
                      color: AppColors.subBlack,
                      fontFamily: "DM Sans",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.023,
                  ),
                  TextField(
                    obscureText: true,
                    controller: passwordController,
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
                      contentPadding: const EdgeInsets.all(14),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "New Password",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "DM Sans",
                        fontWeight: FontWeight.w400,
                        color: AppColors.subWhite,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.visibility_off_outlined,
                          color: Color(0xffe0e0e0),
                          size: 16,
                        ),
                        onPressed: () {},
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
                    controller: confirmPasswordController,
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
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "DM Sans",
                        fontWeight: FontWeight.w400,
                        color: AppColors.subWhite,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.visibility_off_outlined,
                          color: Color(0xffe0e0e0),
                          size: 16,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.subWhite,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.055,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Login();
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
                        "Reset Password",
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
