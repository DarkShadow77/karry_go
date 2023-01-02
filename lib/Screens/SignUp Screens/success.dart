import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karry_go/Screens/SignUp%20Screens/completion_status.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/widgets/logo.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
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
    return Scaffold(
      body: Container(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.055,
                  ),
                  const Logo(
                    color: Colors.white,
                    position: MainAxisAlignment.center,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                    width: size.width * 0.83,
                    height: size.height * 0.37,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: AssetImage(
                          "assets/images/successfully-done.png",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  RichText(
                    softWrap: true,
                    text: TextSpan(
                      text: "Success!!",
                      style: TextStyle(
                        letterSpacing: 1,
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
                    textAlign: TextAlign.center,
                    maxLines: 3,
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
                          text: "Your details have been received at ",
                        ),
                        TextSpan(
                          text: "Kárry",
                          style: TextStyle(
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
                          text:
                              " base. We will verify your details and send a confirmation mail in the next 24 hours. We can’t wait to have you on our team ☺️",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.022,
                  ),
                  RichText(
                    softWrap: true,
                    text: TextSpan(
                      text: "We will get back to you in no time ✅",
                      style: TextStyle(
                        fontFamily: "Dm Sans",
                        wordSpacing: 2,
                        fontSize: 12,
                        color: AppColors.subBlack,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.0345,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.016,
              ),
              child: Divider(
                color: AppColors.subWhite2,
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.08,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CompletionStatus();
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
                  child: Text(
                    "Ok!",
                    style: TextStyle(
                      fontFamily: "DM Sans",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
