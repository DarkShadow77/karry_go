import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karry_go/utils/colors.dart';

class Next extends StatelessWidget {
  const Next({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          elevation: 0,
          toolbarHeight: size.height * 0.11135,
          automaticallyImplyLeading: false,
          floating: true,
          backgroundColor: AppColors.white,
          stretch: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.07,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: size.height * 0.03555,
                ),
                RichText(
                  softWrap: true,
                  text: TextSpan(
                    text: "Trips",
                    style: TextStyle(
                      fontFamily: "Clash Grotesk SemiBold",
                      fontSize: 24,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      softWrap: true,
                      text: TextSpan(
                        text: "All your trip history will appear here",
                        style: TextStyle(
                          fontFamily: "DM Sans",
                          fontSize: 13,
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/svg/calendarsearch.svg",
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01185,
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [],
          ),
        ),
      ],
    );
  }
}
