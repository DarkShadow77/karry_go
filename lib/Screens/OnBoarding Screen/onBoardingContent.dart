import 'package:flutter/material.dart';
import 'package:karry_go/utils/colors.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.size,
    required this.images,
    required this.text,
    required this.title,
  }) : super(key: key);

  final Size size;
  final String images;
  final String title;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size.height * 0.35,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                images,
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.07,
        ),
        Text(
          title,
          style: TextStyle(
            fontFamily: "Clash Grotesk Bold",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        SizedBox(
          height: size.height * 0.015,
        ),
        SizedBox(
          width: size.width * 0.80,
          height: size.height * 0.05,
          child: text,
        ),
      ],
    );
  }
}
