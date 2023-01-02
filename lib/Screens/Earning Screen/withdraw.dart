import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karry_go/utils/colors.dart';

class Withdraw extends StatelessWidget {
  const Withdraw({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01185),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          alignment: Alignment.center,
          width: size.width * 1,
          height: size.height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.subWhite2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg/cardsend.svg",
              ),
              SizedBox(
                width: size.width * 0.025,
              ),
              RichText(
                text: TextSpan(
                  text: "Withdraw Balance",
                  style: TextStyle(
                    fontFamily: "DM Sans",
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
