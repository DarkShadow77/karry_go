import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karry_go/Screens/Earning%20Screen/earnings.dart';
import 'package:karry_go/Screens/Profile%20Screen/profile.dart';
import 'package:karry_go/Screens/Trips%20Screen/trips.dart';
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

  List<Widget> body = [
    Container(
      alignment: Alignment.center,
      child: Text("0"),
    ),
    Trips(),
    Earnings(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: body[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        homePressed: () {
          setState(() {
            _currentIndex = 0;
          });
        },
        tripsPressed: () {
          setState(() {
            _currentIndex = 1;
          });
        },
        earningPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
        profilePressed: () {
          setState(() {
            _currentIndex = 3;
          });
        },
      ),
    );
  }
}
