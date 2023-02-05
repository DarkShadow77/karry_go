import 'package:flutter/material.dart';
import 'package:karry_go/Screens/Earning%20Screen/chart_bar.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/widgets/mySeparator.dart';

class Chart extends StatefulWidget {
  const Chart({
    Key? key,
    required this.size,
    required this.months,
    required this.day,
    required this.filter,
  }) : super(key: key);

  final Size size;
  final List<String> months;
  final List<String> day;
  final String filter;

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<double> monthPerc = [
    0.5,
    0.1,
    0.6,
    0.8,
    0.2,
    0.5,
    0.3,
    0.9,
    1.0,
    0.1,
    0.6,
    0.7,
  ];

  List<double> dayPerc = [
    0.25,
    0.3,
    0.9,
    0.13,
    0.22,
    0.43,
    0.82,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.size.height * 0.315,
          padding: EdgeInsets.only(
            left: widget.size.width * 0.0385,
            right: widget.size.width * 0.0385,
            bottom: widget.size.height * 0.025,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: widget.size.height * 0.01545,
                ),
                child: Row(
                  children: [
                    RichText(
                      softWrap: true,
                      text: TextSpan(
                        text: "100k",
                        style: TextStyle(
                          fontFamily: "DM Sans",
                          fontSize: 11,
                          color: AppColors.subWhite4,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widget.size.width * 0.02565,
                    ),
                    SizedBox(
                      width: widget.size.width * 0.659,
                      child: MySeparator(
                        color: AppColors.subWhite2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: widget.size.height * 0.01545,
                ),
                child: Row(
                  children: [
                    RichText(
                      softWrap: true,
                      text: TextSpan(
                        text: "80k",
                        style: TextStyle(
                          fontFamily: "DM Sans",
                          fontSize: 11,
                          color: AppColors.subWhite4,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widget.size.width * 0.02565,
                    ),
                    SizedBox(
                      width: widget.size.width * 0.668,
                      child: MySeparator(
                        color: AppColors.subWhite2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: widget.size.height * 0.01545,
                ),
                child: Row(
                  children: [
                    RichText(
                      softWrap: true,
                      text: TextSpan(
                        text: "60k",
                        style: TextStyle(
                          fontFamily: "DM Sans",
                          fontSize: 11,
                          color: AppColors.subWhite4,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widget.size.width * 0.02565,
                    ),
                    SizedBox(
                      width: widget.size.width * 0.668,
                      child: MySeparator(
                        color: AppColors.subWhite2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: widget.size.height * 0.01545,
                ),
                child: Row(
                  children: [
                    RichText(
                      softWrap: true,
                      text: TextSpan(
                        text: "40k",
                        style: TextStyle(
                          fontFamily: "DM Sans",
                          fontSize: 11,
                          color: AppColors.subWhite4,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widget.size.width * 0.02565,
                    ),
                    SizedBox(
                      width: widget.size.width * 0.668,
                      child: MySeparator(
                        color: AppColors.subWhite2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: widget.size.height * 0.01545,
                ),
                child: Row(
                  children: [
                    RichText(
                      softWrap: true,
                      text: TextSpan(
                        text: "20k",
                        style: TextStyle(
                          fontFamily: "DM Sans",
                          fontSize: 11,
                          color: AppColors.subWhite4,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widget.size.width * 0.02565,
                    ),
                    SizedBox(
                      width: widget.size.width * 0.668,
                      child: MySeparator(
                        color: AppColors.subWhite2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: widget.size.height * 0.01545,
                ),
                child: Row(
                  children: [
                    RichText(
                      softWrap: true,
                      text: TextSpan(
                        text: "0k",
                        style: TextStyle(
                          fontFamily: "DM Sans",
                          fontSize: 11,
                          color: AppColors.subWhite4,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widget.size.width * 0.02565,
                    ),
                    SizedBox(
                      width: widget.size.width * 0.668,
                      child: MySeparator(
                        color: AppColors.subWhite2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: widget.size.width * 1,
          height: widget.size.height * 0.315,
          padding: EdgeInsets.only(
            left: widget.size.width * 0.12825,
            top: widget.size.height * 0.00355,
            bottom: widget.size.height * 0.00355,
          ),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.filter == "Monthly"
                ? widget.months.length
                : widget.day.length,
            itemBuilder: (BuildContext context, int index) {
              return Chart_Bar(
                size: widget.size,
                periodTotal: widget.filter == "Monthly"
                    ? monthPerc[index]
                    : dayPerc[index],
                text: widget.filter == "Monthly"
                    ? widget.months[index]
                    : widget.day[index],
                colors: index.isOdd ? AppColors.subWhite2 : AppColors.black,
              );
            },
          ),
        ),
      ],
    );
  }
}
