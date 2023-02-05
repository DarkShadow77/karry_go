import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karry_go/Screens/Earning%20Screen/main.dart';
import 'package:karry_go/Screens/Home%20Screen/main.dart';
import 'package:karry_go/Screens/Profile%20Screen/main.dart';
import 'package:karry_go/Screens/Trips%20Screen/main.dart';
import 'package:karry_go/widgets/bottom_navbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  int _currentIndex = 0;
  bool home = true;

  List<Widget> body = [
    Home(),
    Trips(),
    Earnings(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: body[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        homePressed: () {
          setState(() {
            _currentIndex = 0;
            home = true;
          });
        },
        tripsPressed: () {
          setState(() {
            _currentIndex = 1;
            home = false;
          });
        },
        earningPressed: () {
          setState(() {
            _currentIndex = 2;
            home = false;
          });
        },
        profilePressed: () {
          setState(() {
            _currentIndex = 3;
            home = false;
          });
        },
        home: home,
      ),
    );
  }
}
