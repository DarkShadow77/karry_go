import 'package:flutter/material.dart';
import 'package:karry_go/utils/colors.dart';

class Chart_Bar extends StatefulWidget {
  const Chart_Bar({
    Key? key,
    required this.size,
    required this.periodTotal,
    required this.text,
    required this.colors,
  }) : super(key: key);

  final Size size;
  final double periodTotal;
  final String text;
  final Color colors;

  @override
  State<Chart_Bar> createState() => _Chart_BarState();
}

class _Chart_BarState extends State<Chart_Bar> {
  @override
  void initState() {
    super.initState();
    setPeriod();
  }

  void setPeriod() {
    if (widget.periodTotal > 1) {
      setState(() {
        widget.periodTotal == 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: widget.size.width * 0.0513,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 10),
            alignment: Alignment.bottomCenter,
            width: 20,
            height: widget.size.height * 0.236,
            child: FractionallySizedBox(
              heightFactor: widget.periodTotal,
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: widget.colors,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                duration: Duration(seconds: 10),
              ),
            ),
          ),
          Container(
            width: 20,
            height: widget.size.height * 0.0107,
            decoration: BoxDecoration(
              color: widget.colors,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(widget.periodTotal > 0.01 ? 0 : 20),
              ),
            ),
          ),
          SizedBox(
            height: widget.size.height * 0.01778,
          ),
          RichText(
            softWrap: true,
            text: TextSpan(
              text: widget.text,
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
    );
  }
}
