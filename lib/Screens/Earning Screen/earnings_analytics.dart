import 'package:flutter/material.dart';
import 'package:karry_go/Screens/Earning%20Screen/chart.dart';
import 'package:karry_go/Screens/Earning%20Screen/earnings_filter.dart';
import 'package:karry_go/utils/colors.dart';

class EarningsAnalytics extends StatefulWidget {
  EarningsAnalytics({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<EarningsAnalytics> createState() => _EarningsAnalyticsState();
}

class _EarningsAnalyticsState extends State<EarningsAnalytics> {
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  List<String> day = [
    "Mon",
    "Tue",
    "Wed",
    "Thur",
    "Fri",
    "Sat",
    "Sun",
  ];

  String filter = "Monthly";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.39,
      width: widget.size.width * 1,
      padding: EdgeInsets.symmetric(
        vertical: widget.size.height * 0.0083,
      ),
      margin: EdgeInsets.symmetric(vertical: widget.size.height * 0.01185),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: AppColors.subWhite2,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.size.width * 0.0385,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  softWrap: true,
                  text: TextSpan(
                    text: "Earnings Analytics",
                    style: TextStyle(
                      fontFamily: "Clash Grotesk SemiBold",
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _audioHandleFABPressed();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.subWhite,
                  ),
                  child: Row(
                    children: [
                      RichText(
                        softWrap: true,
                        text: TextSpan(
                          text: filter,
                          style: TextStyle(
                            fontFamily: "DM Sans",
                            fontSize: 11,
                            decoration: TextDecoration.underline,
                            color: AppColors.subBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: widget.size.width * 0.025,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.subBlack2,
                        size: 10,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Chart(size: widget.size, filter: filter, months: months, day: day),
        ],
      ),
    );
  }

  void _audioHandleFABPressed() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) => EarningsFilter(
        size: widget.size,
        monthPress: () {
          setState(() {
            filter = "Monthly";
            Navigator.of(context).pop();
          });
        },
        dayPress: () {
          setState(() {
            filter = "Daily";
            Navigator.of(context).pop();
          });
        },
      ),
    );
  }
}
