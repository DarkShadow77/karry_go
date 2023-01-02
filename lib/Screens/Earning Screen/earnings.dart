import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:karry_go/Screens/Earning%20Screen/earnings_analytics.dart';
import 'package:karry_go/Screens/Earning%20Screen/transactions.dart';
import 'package:karry_go/Screens/Earning%20Screen/withdraw.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/utils/currency.dart';

class Earnings extends StatefulWidget {
  const Earnings({Key? key}) : super(key: key);

  @override
  State<Earnings> createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {
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
                      text: "Earnings",
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
                      text: "All your earnings and trip analytics",
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
                        width: size.width * 1,
                        height: size.height * 0.17,
                        margin: EdgeInsets.symmetric(
                            vertical: size.height * 0.01185),
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.03,
                          horizontal: size.width * 0.064,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.black,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/images/vector_lines.png"))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  softWrap: true,
                                  text: TextSpan(
                                    text: "My Balance",
                                    style: TextStyle(
                                      fontFamily: "DM Sans",
                                      fontSize: 13,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                RichText(
                                  softWrap: true,
                                  text: TextSpan(
                                    text: "View History",
                                    style: TextStyle(
                                      fontFamily: "DM Sans",
                                      fontSize: 11,
                                      decoration: TextDecoration.underline,
                                      color: AppColors.subWhite,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            RichText(
                              softWrap: true,
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 32,
                                  color: AppColors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: getCurrency(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: "173,000.00",
                                    style: TextStyle(
                                      fontFamily: "Clash Grotesk SemiBold",
                                    ),
                                  )
                                ],
                              ),
                            ),
                            RichText(
                              softWrap: true,
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.subWhite,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(
                                    text: "From a total earning of ",
                                    style: TextStyle(
                                      fontFamily: "DM Sans",
                                    ),
                                  ),
                                  TextSpan(
                                    text: getCurrency(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: "1,500,000.00",
                                    style: TextStyle(
                                      fontFamily: "DM Sans",
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Withdraw(size: size),
                      EarningsAnalytics(size: size),
                      Transactions(size: size),
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
