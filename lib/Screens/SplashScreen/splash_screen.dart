import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karry_go/widgets/circles.dart';
import 'package:karry_go/widgets/logo.dart';
import 'package:page_transition/page_transition.dart';

import '../OnBoarding Screen/Onboarding.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedSplashScreens(
        size: size,
        color: Colors.white,
        nextScreen: AnimatedSplashScreens(
          size: size,
          color: Colors.black,
          duration: 200,
          nextScreen: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Something went wrong !'),
                );
              } else if (snapshot.hasData) {
                return Onboarding();
              } else {
                return Onboarding();
              }
            },
          ),
        ),
        duration: 600,
      ),
    );
  }
}

class AnimatedSplashScreens extends StatelessWidget {
  const AnimatedSplashScreens({
    Key? key,
    required this.size,
    required this.color,
    required this.nextScreen,
    required this.duration,
  }) : super(key: key);

  final Size size;
  final Color color;
  final Widget nextScreen;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Circles(
        size: size,
        color: color,
        height: size.height * 0.39,
        width: size.width * 0.85,
        child: Logo(color: color, position: MainAxisAlignment.center),
      ),
      nextScreen: nextScreen,
      splashIconSize: double.infinity,
      backgroundColor:
          color == Colors.black ? Color(0xff121212) : Color(0xfffafafa),
      duration: 4000,
      animationDuration: Duration(milliseconds: duration),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
