import 'package:flutter/material.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/utils/currency.dart';

class TripSlide extends StatelessWidget {
  const TripSlide({
    Key? key,
    required this.size,
    required this.subTitle,
    required this.image,
    required this.unit,
    this.unitSub = "",
    this.first = false,
    this.third = false,
    this.last = false,
    required this.color,
  }) : super(key: key);

  final Size size;
  final String subTitle;
  final String image;
  final String unit;
  final String unitSub;
  final bool third;
  final bool first;
  final bool last;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.3718,
      height: size.height * 0.10309,
      margin: EdgeInsets.only(
        top: size.height * 0.01185,
        bottom: size.height * 0.01185,
        right: last ? size.width * 0.08 : size.width * 0.0513,
        left: first ? size.width * 0.08 : 0,
      ),
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.0178,
        horizontal: size.width * 0.03847,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.withOpacity(0.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: size.width * 0.064125,
                height: size.height * 0.029625,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                    image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage(image),
                    )),
              ),
              RichText(
                softWrap: true,
                text: TextSpan(
                  text: "  " + subTitle,
                  style: TextStyle(
                    fontFamily: "DM Sans",
                    fontSize: 12,
                    color: AppColors.subBlack2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              RichText(
                softWrap: true,
                text: TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.black,
                    ),
                    children: [
                      TextSpan(
                        text: third ? getCurrency() : "",
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                          text: unit,
                          style: TextStyle(
                            fontFamily: "Clash Grotesk SemiBold",
                          ))
                    ]),
              ),
              RichText(
                softWrap: true,
                text: TextSpan(
                  text: "  ${unitSub}",
                  style: TextStyle(
                    fontFamily: "DM Sans",
                    fontSize: 12,
                    color: AppColors.subBlack2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
