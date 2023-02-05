import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/utils/currency.dart';
import 'package:karry_go/widgets/mySeparator.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: size.height * 0.01185,
          ),
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.005925,
            horizontal: size.width * 0.012825,
          ),
          width: size.width * 1,
          height: size.height * 0.0474,
          decoration: BoxDecoration(
            color: AppColors.subWhite2,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TabBar(
            indicator: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(5),
            ),
            labelColor: AppColors.white,
            unselectedLabelColor: AppColors.subBlack2,
            labelStyle: TextStyle(
              fontFamily: "DM Sans",
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            tabs: [
              Tab(
                child: Text(
                  'Upcoming',
                ),
              ),
              Tab(
                child: Text(
                  'Completed',
                ),
              ),
              Tab(
                child: Text(
                  'Canceled',
                ),
              ),
            ],
          ),
        ),
        Container(
          height: size.height * 0.51,
          child: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                child: RichText(
                                  softWrap: true,
                                  text: TextSpan(
                                    text: "Today, Nov 22",
                                    style: TextStyle(
                                      fontFamily: "Clash Grotesk SemiBold",
                                      fontSize: 16,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: size.height * 0.053325,
                                              width: size.width * 0.115425,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.subWhite2,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/upcoming1.png"),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.038475,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Bolanle Adeshina",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Clash Grotesk SemiBold",
                                                      fontSize: 14,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "50 mins ago",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Trip Cost",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: AppColors.black,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: getCurrency(),
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        TextSpan(
                                                            text: "5,000",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Clash Grotesk SemiBold",
                                                            ))
                                                      ]),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_green.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: size.width * 0.0385),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "Morgan Elumelu Street Thom...",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "1:32pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.0237,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "28 Opebi Rd, Opebi, Lagos",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "3:35pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: size.height * 0.053325,
                                              width: size.width * 0.115425,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.subWhite2,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/upcoming2.png"),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.038475,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Ikechukwu Francis",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Clash Grotesk SemiBold",
                                                      fontSize: 14,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "3 hrs ago",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Trip Cost",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: AppColors.black,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: getCurrency(),
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        TextSpan(
                                                            text: "2,700",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Clash Grotesk SemiBold",
                                                            ))
                                                      ]),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_green.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: size.width * 0.0385),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "Oba Akinjobi Way, Ikeja GRA",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "1:32pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.0237,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "1 Campground Rd, Anthony, La...",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "3:35pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: size.height * 0.053325,
                                              width: size.width * 0.115425,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.subWhite2,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.038475,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Bolanle Adeshina",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Clash Grotesk SemiBold",
                                                      fontSize: 14,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "5 hrs ago",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Trip Cost",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: AppColors.black,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: getCurrency(),
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        TextSpan(
                                                            text: "3,200",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Clash Grotesk SemiBold",
                                                            ))
                                                      ]),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_green.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: size.width * 0.0385,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "4, Abudu street, Ogudu Road",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "1:32pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.0237,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "22 Akinyemi St, Owutu, Lagos",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "3:35pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                child: RichText(
                                  softWrap: true,
                                  text: TextSpan(
                                    text: "Monday, Nov 21",
                                    style: TextStyle(
                                      fontFamily: "Clash Grotesk SemiBold",
                                      fontSize: 16,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: size.height * 0.053325,
                                              width: size.width * 0.115425,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.subWhite2,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.038475,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Aisha Ahmed",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Clash Grotesk SemiBold",
                                                      fontSize: 14,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "2 days ago",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Trip Cost",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: AppColors.black,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: getCurrency(),
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        TextSpan(
                                                            text: "4,500",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Clash Grotesk SemiBold",
                                                            ))
                                                      ]),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_green.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: size.width * 0.0385),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "7 Adeola Solomon St, ketu, La...",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "1:32pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.0237,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "32 Diya St, Gbagada, Lagos",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "3:35pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: size.height * 0.053325,
                                              width: size.width * 0.115425,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.subWhite2,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.038475,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Damilare Ogunladi",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Clash Grotesk SemiBold",
                                                      fontSize: 14,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "2 days ago",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Trip Cost",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: AppColors.black,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: getCurrency(),
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        TextSpan(
                                                            text: "7,400",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Clash Grotesk SemiBold",
                                                            ))
                                                      ]),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_green.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: size.width * 0.0385),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "2, 4 Mojoyinola St, Somolu, La...",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "1:32pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.0237,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "6 Ayodele St, ladilak, Lagos",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "3:35pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                ],
              ),
              CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                child: RichText(
                                  softWrap: true,
                                  text: TextSpan(
                                    text: "Today, Nov 22",
                                    style: TextStyle(
                                      fontFamily: "Clash Grotesk SemiBold",
                                      fontSize: 16,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: size.height * 0.053325,
                                              width: size.width * 0.115425,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.subWhite2,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/complete1.png"),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.038475,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Bolanle Adeshina",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Clash Grotesk SemiBold",
                                                      fontSize: 14,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "50 mins ago",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Trip Cost",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: AppColors.black,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: getCurrency(),
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        TextSpan(
                                                            text: "5,000",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Clash Grotesk SemiBold",
                                                            ))
                                                      ]),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_green.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: size.width * 0.0385),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "Morgan Elumelu Street Thom...",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "1:32pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.0237,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "28 Opebi Rd, Opebi, Lagos",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "3:35pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: size.height * 0.053325,
                                              width: size.width * 0.115425,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.subWhite2,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/complete2.png"),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.038475,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Ikechukwu Francis",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Clash Grotesk SemiBold",
                                                      fontSize: 14,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "3 hrs ago",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Trip Cost",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: AppColors.black,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: getCurrency(),
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        TextSpan(
                                                            text: "2,700",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Clash Grotesk SemiBold",
                                                            ))
                                                      ]),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_green.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: size.width * 0.0385),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "Oba Akinjobi Way, Ikeja GRA",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "1:32pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.0237,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "1 Campground Rd, Anthony, La...",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "3:35pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: size.height * 0.053325,
                                              width: size.width * 0.115425,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.subWhite2,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.038475,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Bolanle Adeshina",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Clash Grotesk SemiBold",
                                                      fontSize: 14,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "5 hrs ago",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Trip Cost",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: AppColors.black,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: getCurrency(),
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        TextSpan(
                                                            text: "3,200",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Clash Grotesk SemiBold",
                                                            ))
                                                      ]),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_green.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: size.width * 0.0385,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "4, Abudu street, Ogudu Road",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "1:32pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.0237,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "22 Akinyemi St, Owutu, Lagos",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "3:35pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                child: RichText(
                                  softWrap: true,
                                  text: TextSpan(
                                    text: "Monday, Nov 21",
                                    style: TextStyle(
                                      fontFamily: "Clash Grotesk SemiBold",
                                      fontSize: 16,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: size.height * 0.053325,
                                              width: size.width * 0.115425,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.subWhite2,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.038475,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Aisha Ahmed",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Clash Grotesk SemiBold",
                                                      fontSize: 14,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "2 days ago",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Trip Cost",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: AppColors.black,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: getCurrency(),
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        TextSpan(
                                                            text: "4,500",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Clash Grotesk SemiBold",
                                                            ))
                                                      ]),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_green.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: size.width * 0.0385),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "7 Adeola Solomon St, ketu, La...",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "1:32pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.0237,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "32 Diya St, Gbagada, Lagos",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "3:35pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: size.height * 0.053325,
                                              width: size.width * 0.115425,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.subWhite2,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.038475,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Damilare Ogunladi",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Clash Grotesk SemiBold",
                                                      fontSize: 14,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "2 days ago",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "Trip Cost",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      size.height * 0.005925,
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: AppColors.black,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: getCurrency(),
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        TextSpan(
                                                            text: "7,400",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Clash Grotesk SemiBold",
                                                            ))
                                                      ]),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_green.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: size.width * 0.0385),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "2, 4 Mojoyinola St, Somolu, La...",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "1:32pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.0237,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "6 Ayodele St, ladilak, Lagos",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "3:35pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                ],
              ),
              CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                child: RichText(
                                  softWrap: true,
                                  text: TextSpan(
                                    text: "Today, Nov 22",
                                    style: TextStyle(
                                      fontFamily: "Clash Grotesk SemiBold",
                                      fontSize: 16,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: size.height * 0.053325,
                                          width: size.width * 0.115425,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.subWhite2,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/canceled1.png"),
                                              )),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.038475,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                text: TextSpan(
                                                  text: "Emeka Wilson",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "Clash Grotesk SemiBold",
                                                    fontSize: 14,
                                                    color: AppColors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.005925,
                                              ),
                                              RichText(
                                                softWrap: true,
                                                text: TextSpan(
                                                  text: "10 mins ago",
                                                  style: TextStyle(
                                                    fontFamily: "DM Sans",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.subBlack2,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_red.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: size.width * 0.0385),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "Costain Road, Ebute Metta, Lagos",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "1:32pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.0237,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "Oloto St, Adekunle, Lagos",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "3:35pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: size.height * 0.053325,
                                          width: size.width * 0.115425,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.subWhite2,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/canceled2.png"),
                                              )),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.038475,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                softWrap: true,
                                                text: TextSpan(
                                                  text: "Ikechukwu Francis",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "Clash Grotesk SemiBold",
                                                    fontSize: 14,
                                                    color: AppColors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.005925,
                                              ),
                                              RichText(
                                                softWrap: true,
                                                text: TextSpan(
                                                  text: "3 hrs ago",
                                                  style: TextStyle(
                                                    fontFamily: "DM Sans",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.subBlack2,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_red.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: size.width * 0.0385),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "19 Akinpelu St, Bariga, Lagos",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "1:32pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.0237,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "Willoughby St, Adekunle, Lagos",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "3:35pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: size.height * 0.053325,
                                          width: size.width * 0.115425,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.subWhite2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.038475,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                softWrap: true,
                                                text: TextSpan(
                                                  text: "Bolanle Adeshina",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "Clash Grotesk SemiBold",
                                                    fontSize: 14,
                                                    color: AppColors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.005925,
                                              ),
                                              RichText(
                                                softWrap: true,
                                                text: TextSpan(
                                                  text: "5 hrs ago",
                                                  style: TextStyle(
                                                    fontFamily: "DM Sans",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.subBlack2,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_red.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: size.width * 0.0385,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "4, Abudu street, Ogudu Road",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "1:32pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.0237,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "22 Akinyemi St, Owutu, Lagos",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "3:35pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                child: RichText(
                                  softWrap: true,
                                  text: TextSpan(
                                    text: "Monday, Nov 21",
                                    style: TextStyle(
                                      fontFamily: "Clash Grotesk SemiBold",
                                      fontSize: 16,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: size.height * 0.053325,
                                          width: size.width * 0.115425,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.subWhite2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.038475,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                softWrap: true,
                                                text: TextSpan(
                                                  text: "Aisha Ahmed",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "Clash Grotesk SemiBold",
                                                    fontSize: 14,
                                                    color: AppColors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.005925,
                                              ),
                                              RichText(
                                                softWrap: true,
                                                text: TextSpan(
                                                  text: "2 days ago",
                                                  style: TextStyle(
                                                    fontFamily: "DM Sans",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.subBlack2,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_red.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: size.width * 0.0385),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text:
                                                        "7 Adeola Solomon St, ketu, La...",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "1:32pm",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: size.height * 0.0237,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text:
                                                        "32 Diya St, Gbagada, Lagos",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                                RichText(
                                                  softWrap: true,
                                                  text: TextSpan(
                                                    text: "3:35pm",
                                                    style: TextStyle(
                                                      fontFamily: "DM Sans",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.subBlack2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height * 0.2038,
                                width: size.width * 1,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.041,
                                  vertical: size.height * 0.019,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01185,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.subWhite2,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: size.height * 0.053325,
                                          width: size.width * 0.115425,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.subWhite2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.038475,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                softWrap: true,
                                                text: TextSpan(
                                                  text: "Damilare Ogunladi",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "Clash Grotesk SemiBold",
                                                    fontSize: 14,
                                                    color: AppColors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.005925,
                                              ),
                                              RichText(
                                                softWrap: true,
                                                text: TextSpan(
                                                  text: "2 days ago",
                                                  style: TextStyle(
                                                    fontFamily: "DM Sans",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.subBlack2,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    MySeparator(
                                      color: AppColors.subWhite2,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/location_blue.svg",
                                            ),
                                            DashedLine(
                                              color: AppColors.subWhite4,
                                              height: 1.5,
                                              heightContainer:
                                                  size.height * 0.01735,
                                            ),
                                            SvgPicture.asset(
                                              "assets/svg/location_red.svg",
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: size.width * 0.0385),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "2, 4 Mojoyinola St, Somolu, La...",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "1:32pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.0237,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text:
                                                          "6 Ayodele St, ladilak, Lagos",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      text: "3:35pm",
                                                      style: TextStyle(
                                                        fontFamily: "DM Sans",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColors.subBlack2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
