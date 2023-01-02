import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karry_go/utils/colors.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    Key? key,
    this.currentIndex = 1,
    required this.homePressed,
    required this.tripsPressed,
    required this.earningPressed,
    required this.profilePressed,
  }) : super(key: key);

  final int currentIndex;
  final VoidCallback homePressed;
  final VoidCallback tripsPressed;
  final VoidCallback earningPressed;
  final VoidCallback profilePressed;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.845,
      height: size.height * 0.06275,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.08,
      ),
      margin: EdgeInsets.only(
        bottom: size.height * 0.051,
        top: size.height * 0.024,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * 0.665,
            height: size.height * 0.06275,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
              vertical: size.height * 0.0071,
            ),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: widget.homePressed,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(1, 1),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    foregroundColor: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Visibility(
                        visible: false,
                        child: Container(
                          width: size.width * 0.0154,
                          height: size.height * 0.0071,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.0076,
                      ),
                      SvgPicture.asset(
                        widget.currentIndex == 0
                            ? "assets/svg/HOME BULK.svg"
                            : "assets/svg/HOME LINE.svg",
                      ),
                      SizedBox(
                        height: size.height * 0.0076,
                      ),
                      Visibility(
                        visible: widget.currentIndex == 0 ? true : false,
                        child: Container(
                          width: size.width * 0.0154,
                          height: size.height * 0.0071,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: widget.tripsPressed,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(1, 1),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    foregroundColor: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Visibility(
                        visible: false,
                        child: Container(
                          width: size.width * 0.0154,
                          height: size.height * 0.0071,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.0076,
                      ),
                      SvgPicture.asset(
                        widget.currentIndex == 1
                            ? "assets/svg/TRIPS BULK.svg"
                            : "assets/svg/TRIPS LINE.svg",
                      ),
                      SizedBox(
                        height: size.height * 0.0076,
                      ),
                      Visibility(
                        visible: widget.currentIndex == 1 ? true : false,
                        child: Container(
                          width: size.width * 0.0154,
                          height: size.height * 0.0071,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: widget.earningPressed,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(1, 1),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    foregroundColor: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Visibility(
                        visible: false,
                        child: Container(
                          width: size.width * 0.0154,
                          height: size.height * 0.0071,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.0076,
                      ),
                      SvgPicture.asset(
                        widget.currentIndex == 2
                            ? "assets/svg/EARNINGS BULK.svg"
                            : "assets/svg/EARNINGS LINE.svg",
                      ),
                      SizedBox(
                        height: size.height * 0.0076,
                      ),
                      Visibility(
                        visible: widget.currentIndex == 2 ? true : false,
                        child: Container(
                          width: size.width * 0.0154,
                          height: size.height * 0.0071,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.136,
            height: size.height * 0.06275,
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.006,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.black,
            ),
            child: ElevatedButton(
              onPressed: widget.profilePressed,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(1, 1),
                backgroundColor: Colors.transparent,
                elevation: 0,
                foregroundColor: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Visibility(
                    visible: false,
                    child: Container(
                      width: size.width * 0.0154,
                      height: size.height * 0.0071,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    widget.currentIndex == 3
                        ? "assets/svg/PROFILE BULK.svg"
                        : "assets/svg/PROFILE LINE.svg",
                  ),
                  Visibility(
                    visible: widget.currentIndex == 3 ? true : false,
                    child: Container(
                      width: size.width * 0.0154,
                      height: size.height * 0.0071,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
