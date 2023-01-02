import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/widgets/mySeparator.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
    return Container(
      width: size.width * 1,
      color: AppColors.white,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            toolbarHeight: size.height * 0.11135,
            automaticallyImplyLeading: false,
            floating: true,
            backgroundColor: AppColors.white,
            stretch: true,
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
                      text: "Profile",
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
                  RichText(
                    softWrap: true,
                    text: TextSpan(
                      text: "Access and update your account records",
                      style: TextStyle(
                        fontFamily: "DM Sans",
                        fontSize: 13,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
              [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.08,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: size.height * 0.03555,
                            bottom: size.height * 0.01185),
                        child: Row(
                          children: [
                            Container(
                              height: size.height * 0.10072,
                              width: size.width * 0.218,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.subWhite2),
                            ),
                            SizedBox(
                              width: size.width * 0.0513,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "Bolaji Kolawole",
                                    style: TextStyle(
                                      fontFamily: "Clash Grotesk SemiBold",
                                      fontSize: 20,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.005925,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "b.kolawole@karrygo.com",
                                    style: TextStyle(
                                      fontFamily: "DM Sans",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.subBlack2,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.005925,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "0816 839 3384",
                                    style: TextStyle(
                                      fontFamily: "DM Sans",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.subBlack2,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.005925,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ShaderMask(
                                      blendMode: BlendMode.srcATop,
                                      shaderCallback: (bounds) =>
                                          LinearGradient(
                                        colors: [
                                          AppColors.star1,
                                          AppColors.star2,
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ).createShader(bounds),
                                      child: Icon(
                                        Icons.star_rounded,
                                        size: 16,
                                      ),
                                    ),
                                    ShaderMask(
                                      blendMode: BlendMode.srcATop,
                                      shaderCallback: (bounds) =>
                                          LinearGradient(
                                        colors: [
                                          AppColors.star1,
                                          AppColors.star2,
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ).createShader(bounds),
                                      child: Icon(
                                        Icons.star_rounded,
                                        size: 16,
                                      ),
                                    ),
                                    ShaderMask(
                                      blendMode: BlendMode.srcATop,
                                      shaderCallback: (bounds) =>
                                          LinearGradient(
                                        colors: [
                                          AppColors.star1,
                                          AppColors.star2,
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ).createShader(bounds),
                                      child: Icon(
                                        Icons.star_rounded,
                                        size: 16,
                                      ),
                                    ),
                                    ShaderMask(
                                      blendMode: BlendMode.srcATop,
                                      shaderCallback: (bounds) =>
                                          LinearGradient(
                                        colors: [
                                          AppColors.star1,
                                          AppColors.star2,
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ).createShader(bounds),
                                      child: Icon(
                                        Icons.star_rounded,
                                        size: 16,
                                      ),
                                    ),
                                    ShaderMask(
                                      blendMode: BlendMode.srcATop,
                                      shaderCallback: (bounds) =>
                                          LinearGradient(
                                        colors: [
                                          AppColors.star1,
                                          AppColors.subWhite2,
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ).createShader(bounds),
                                      child: Icon(
                                        Icons.star_half_rounded,
                                        size: 16,
                                        color: AppColors.subWhite2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.0237),
                        child: MySeparator(
                          color: AppColors.subWhite2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Registered",
                                  style: TextStyle(
                                    fontFamily: "DM Sans",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.subBlack2,
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.0083),
                              RichText(
                                text: TextSpan(
                                  text: "2 Apr, 2022",
                                  style: TextStyle(
                                    fontFamily: "Clash Grotesk SemiBold",
                                    fontSize: 15,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Referrals",
                                  style: TextStyle(
                                    fontFamily: "DM Sans",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.subBlack2,
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.0083),
                              RichText(
                                text: TextSpan(
                                  text: "12",
                                  style: TextStyle(
                                    fontFamily: "Clash Grotesk SemiBold",
                                    fontSize: 15,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Level",
                                  style: TextStyle(
                                    fontFamily: "DM Sans",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.subBlack2,
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.0083),
                              RichText(
                                text: TextSpan(
                                  text: "Professional",
                                  style: TextStyle(
                                    fontFamily: "Clash Grotesk SemiBold",
                                    fontSize: 15,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.0237),
                        child: MySeparator(
                          color: AppColors.subWhite2,
                        ),
                      ),
                      Container(
                        height: size.height * 0.3768,
                        width: size.width * 1,
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01185,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: size.height * 0.0237,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 1,
                            color: AppColors.subWhite2,
                          ),
                        ),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.01185,
                                    horizontal: size.width * 0.0513,
                                  ),
                                  elevation: 0,
                                  foregroundColor: AppColors.subWhite,
                                  backgroundColor: AppColors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: size.height * 0.04147,
                                          width: size.width * 0.08975,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.subWhite2,
                                          ),
                                          child: SvgPicture.asset(
                                              "assets/svg/setting2.svg"),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.0513,
                                        ),
                                        RichText(
                                          softWrap: true,
                                          text: TextSpan(
                                            text: "Settings",
                                            style: TextStyle(
                                              fontFamily: "DM Sans",
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: AppColors.black,
                                      size: 12,
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.01185,
                                    horizontal: size.width * 0.0513,
                                  ),
                                  elevation: 0,
                                  foregroundColor: AppColors.subWhite,
                                  backgroundColor: AppColors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: size.height * 0.04147,
                                          width: size.width * 0.08975,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.subWhite2,
                                          ),
                                          child: SvgPicture.asset(
                                              "assets/svg/card.svg"),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.0513,
                                        ),
                                        RichText(
                                          softWrap: true,
                                          text: TextSpan(
                                            text: "Billing Details",
                                            style: TextStyle(
                                              fontFamily: "DM Sans",
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: AppColors.black,
                                      size: 12,
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.01185,
                                    horizontal: size.width * 0.0513,
                                  ),
                                  elevation: 0,
                                  foregroundColor: AppColors.subWhite,
                                  backgroundColor: AppColors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: size.height * 0.04147,
                                          width: size.width * 0.08975,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.subWhite2,
                                          ),
                                          child: SvgPicture.asset(
                                              "assets/svg/documenttext1.svg"),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.0513,
                                        ),
                                        RichText(
                                          softWrap: true,
                                          text: TextSpan(
                                            text: "Legal Documents",
                                            style: TextStyle(
                                              fontFamily: "DM Sans",
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: AppColors.black,
                                      size: 12,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.0513,
                                ),
                                child: Divider(
                                  thickness: 1,
                                  color: AppColors.subWhite2,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.01185,
                                    horizontal: size.width * 0.0513,
                                  ),
                                  elevation: 0,
                                  foregroundColor: AppColors.subWhite,
                                  backgroundColor: AppColors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: size.height * 0.04147,
                                          width: size.width * 0.08975,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.subWhite2,
                                          ),
                                          child: SvgPicture.asset(
                                              "assets/svg/callcalling.svg"),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.0513,
                                        ),
                                        RichText(
                                          softWrap: true,
                                          text: TextSpan(
                                            text: "Contact Support",
                                            style: TextStyle(
                                              fontFamily: "DM Sans",
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: AppColors.black,
                                      size: 12,
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.01185,
                                    horizontal: size.width * 0.0513,
                                  ),
                                  elevation: 0,
                                  foregroundColor: AppColors.subWhite,
                                  backgroundColor: AppColors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: size.height * 0.04147,
                                          width: size.width * 0.08975,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.subWhite2,
                                          ),
                                          child: SvgPicture.asset(
                                              "assets/svg/logoutcurve.svg"),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.0513,
                                        ),
                                        RichText(
                                          softWrap: true,
                                          text: TextSpan(
                                            text: "Log Out",
                                            style: TextStyle(
                                              fontFamily: "DM Sans",
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: AppColors.red,
                                      size: 12,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Transactions extends StatelessWidget {
  const Transactions({
    Key? key,
    required this.size,
    required this.date,
    required this.price,
    required this.withdrawal,
  }) : super(key: key);

  final Size size;
  final String date;
  final String price;
  final bool withdrawal;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: size.height * 0.0297,
                width: size.width * 0.0642,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: withdrawal ? AppColors.red : AppColors.green,
                ),
                child: RotatedBox(
                  quarterTurns: withdrawal ? 0 : 2,
                  child: Icon(
                    Icons.moving_outlined,
                    color: AppColors.white,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    softWrap: true,
                    text: TextSpan(
                      text: withdrawal ? "Withdrawal" : "Trip earning",
                      style: TextStyle(
                        fontFamily: "DM Sans",
                        fontSize: 12,
                        color: AppColors.subBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.006,
                  ),
                  RichText(
                    softWrap: true,
                    text: TextSpan(
                      text: date,
                      style: TextStyle(
                        fontFamily: "DM Sans",
                        fontSize: 11,
                        color: AppColors.subWhite4,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          RichText(
            softWrap: true,
            text: TextSpan(
              text: "₦${price}",
              style: TextStyle(
                fontFamily: "DM Sans",
                fontSize: 12,
                color: AppColors.subBlack,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
