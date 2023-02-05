import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karry_go/Screens/Login%20Screens/main.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/widgets/logo.dart';
import 'package:karry_go/widgets/mySeparator.dart';

class CompletionStatus extends StatefulWidget {
  const CompletionStatus({Key? key}) : super(key: key);

  @override
  State<CompletionStatus> createState() => _CompletionStatusState();
}

class _CompletionStatusState extends State<CompletionStatus> {
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: size.height * 0.055,
              ),
              const Logo(
                color: Colors.white,
                position: MainAxisAlignment.center,
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              RichText(
                softWrap: true,
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Completion Status",
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
                textAlign: TextAlign.center,
                maxLines: 2,
                softWrap: true,
                text: TextSpan(
                  text:
                      "While your account is being screened for verification, you can follow up on your verification progress.",
                  style: TextStyle(
                    fontFamily: "DM Sans",
                    fontSize: 12,
                    height: 1.7,
                    color: AppColors.subBlack,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 20,
                    ),
                    height: size.height * 0.435,
                    child: DashedLine(
                      color: AppColors.subWhite,
                      height: 5,
                    ),
                  ),
                  Column(
                    children: [
                      confirmedStatus(
                          size: size,
                          mainText: "Basic Information",
                          subText: "All information confirmed"),
                      pendingStatus(
                          size: size,
                          mainText: "Address Information",
                          subText: "Pending confirmation"),
                      pendingStatus(
                          size: size,
                          mainText: "Documents",
                          subText: "Pending confirmation"),
                      warningStatus(
                        size: size,
                        mainText: "Guarantor Details",
                        onpressed: () {},
                      ),
                      warningStatus(
                        size: size,
                        mainText: "Payment Information",
                        onpressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.015,
                ),
                child: GestureDetector(
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
                    child: Text(
                      "Go to Login!",
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
              RichText(
                textAlign: TextAlign.center,
                softWrap: true,
                text: TextSpan(
                  text: "For more information please contact us at",
                  style: TextStyle(
                    fontFamily: "DM Sans",
                    fontSize: 12,
                    height: 1.7,
                    color: AppColors.subBlack,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                softWrap: true,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: "DM Sans",
                    fontSize: 12,
                    color: AppColors.subBlack,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: "support@karrygo.com ",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.blue,
                      ),
                    ),
                    TextSpan(
                      text: "or call ",
                    ),
                    TextSpan(
                      text: "+234 801 234 5678",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.blue,
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

class confirmedStatus extends StatelessWidget {
  confirmedStatus({
    Key? key,
    required this.size,
    required this.mainText,
    required this.subText,
  }) : super(key: key);

  final Size size;
  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.check_circle_rounded,
              size: 23,
              color: AppColors.green,
            ),
            SizedBox(
              width: size.width * 0.07,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  softWrap: true,
                  text: TextSpan(
                    text: mainText,
                    style: TextStyle(
                      fontFamily: "DM Sans",
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.006,
                ),
                RichText(
                  softWrap: true,
                  text: TextSpan(
                    text: subText,
                    style: TextStyle(
                      fontFamily: "DM Sans",
                      fontSize: 12,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.045,
        ),
      ],
    );
  }
}

class pendingStatus extends StatelessWidget {
  pendingStatus({
    Key? key,
    required this.size,
    required this.mainText,
    required this.subText,
  }) : super(key: key);

  final Size size;
  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.access_time_filled_rounded,
              size: 23,
              color: AppColors.yellow,
            ),
            SizedBox(
              width: size.width * 0.07,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  softWrap: true,
                  text: TextSpan(
                    text: mainText,
                    style: TextStyle(
                      fontFamily: "DM Sans",
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.006,
                ),
                RichText(
                  softWrap: true,
                  text: TextSpan(
                    text: subText,
                    style: TextStyle(
                      fontFamily: "DM Sans",
                      fontSize: 12,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.045,
        ),
      ],
    );
  }
}

class warningStatus extends StatelessWidget {
  warningStatus({
    Key? key,
    required this.size,
    required this.mainText,
    required this.onpressed,
  }) : super(key: key);

  final Size size;
  final String mainText;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.warning_rounded,
              size: 23,
              color: AppColors.red,
            ),
            SizedBox(
              width: size.width * 0.07,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  softWrap: true,
                  text: TextSpan(
                    text: mainText,
                    style: TextStyle(
                      fontFamily: "DM Sans",
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.006,
                ),
                TextButton(
                  onPressed: onpressed,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: AppColors.subWhite,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        softWrap: true,
                        text: TextSpan(
                          text: "Some fields need to be checked",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: "DM Sans",
                            fontSize: 12,
                            color: AppColors.red,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 16,
                        color: AppColors.red,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.045,
        ),
      ],
    );
  }
}
