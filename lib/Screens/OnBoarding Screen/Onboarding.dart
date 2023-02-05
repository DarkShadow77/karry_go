import 'dart:async';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:karry_go/Screens/Login%20Screens/main.dart';
import 'package:karry_go/Screens/OnBoarding%20Screen/onBoardingContent.dart';
import 'package:karry_go/Screens/SignUp%20Screens/main.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/widgets/circles.dart';
import 'package:karry_go/widgets/logo.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      return setState(() {
        if (_currentPage != 3) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInCirc,
        );
      });
    });
  }

  List<Map<String, String>> onBoardingData = [
    {
      "image": "assets/images/drivemi(1).png",
      "title": "Register As Driver",
    },
    {
      "image": "assets/images/drivemi(2).png",
      "title": "Accept Requests",
    },
    {
      "image": "assets/images/drivemi(3).png",
      "title": "Earn from Driving",
    },
    {
      "image": "assets/images/drivemi(4).png",
      "title": "Rate Your Customer",
    },
  ];

  List<Widget> onBoardingDataWidget = [
    RichText(
      textAlign: TextAlign.center,
      softWrap: true,
      text: TextSpan(
        style: TextStyle(
          fontFamily: "DM Sans",
          fontSize: 13,
          color: AppColors.subWhite,
        ), //apply style to all
        children: [
          TextSpan(
            text: "The first step to becoming a ",
          ),
          TextSpan(
            text: "Kárry",
            style: TextStyle(
              color: AppColors.white,
              fontFamily: "Clash Grotesk SemiBold",
            ),
          ),
          TextSpan(
            text: "Go",
            style: TextStyle(
              fontFamily: "Space Grotesk",
              color: Color(0xff27ae60),
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text:
                " driver is going through the registration process and registering ",
          ),
        ],
      ),
    ),
    RichText(
      textAlign: TextAlign.center,
      maxLines: 2,
      softWrap: true,
      text: TextSpan(
        style: TextStyle(
          fontFamily: "DM Sans",
          fontSize: 13,
          color: AppColors.subWhite,
        ), //apply style to all
        children: [
          TextSpan(
            text:
                "People will make trip reques and you have a choice to accept or decline their requests",
          ),
        ],
      ),
    ),
    RichText(
      textAlign: TextAlign.center,
      maxLines: 2,
      softWrap: true,
      text: TextSpan(
        style: TextStyle(
          fontFamily: "DM Sans",
          fontSize: 13,
          color: AppColors.subWhite,
        ), //apply style to all
        children: [
          TextSpan(
            text:
                "Trip fares are calculated per minute of initiating trips. You can withdraw your earnings at any time",
          ),
        ],
      ),
    ),
    RichText(
      textAlign: TextAlign.center,
      maxLines: 2,
      softWrap: true,
      text: TextSpan(
        style: TextStyle(
          fontFamily: "DM Sans",
          fontSize: 13,
          color: AppColors.subWhite,
        ), //apply style to all
        children: [
          TextSpan(
            text: "Kárry",
            style: TextStyle(
              color: AppColors.white,
              fontFamily: "Clash Grotesk SemiBold",
            ),
          ),
          TextSpan(
            text: "Go",
            style: TextStyle(
              fontFamily: "Space Grotesk",
              color: Color(0xff27ae60),
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text:
                " allows drivers rate their customers, so that the next driver can know what to expect.",
          ),
        ],
      ),
    ),
  ];

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
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              height: size.height * 0.78,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.22,
                      ),
                      Center(
                        child: Circles(
                          size: size,
                          color: Colors.black,
                          height: size.height * 0.37,
                          width: size.height * 0.78,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.035,
                        ),
                        FadeInUp(
                          duration: Duration(seconds: 2),
                          child: Logo(
                            color: Colors.black,
                            position: MainAxisAlignment.center,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Container(
                          height: size.height * 0.52,
                          child: PageView.builder(
                            allowImplicitScrolling: true,
                            controller: _pageController,
                            physics: BouncingScrollPhysics(),
                            onPageChanged: (value) {
                              setState(() {
                                _currentPage = value;
                              });
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: onBoardingData.length,
                            itemBuilder: (_, index) {
                              return OnBoardingContent(
                                size: size,
                                images:
                                    onBoardingData[index]["image"].toString(),
                                text: onBoardingDataWidget[index],
                                title:
                                    onBoardingData[index]["title"].toString(),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              onBoardingData.length,
                              (indexDots) {
                                return AnimatedContainer(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: _currentPage == indexDots ? 27 : 9,
                                  height: 9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: _currentPage == indexDots
                                        ? AppColors.white
                                        : AppColors.white.withOpacity(0.27),
                                  ),
                                  duration: Duration(milliseconds: 300),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                      width: size.width * 0.40,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.22),
                            blurRadius: 12,
                            spreadRadius: -7,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontFamily: "DM Sans",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUp();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: size.width * 0.40,
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
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            fontFamily: "DM Sans",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              "version 3.5",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "DM Sans",
                color: AppColors.subWhite,
              ),
            )
          ],
        ),
      ),
    );
    /*Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            color: Colors.lightBlue,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );*/
  }
}
