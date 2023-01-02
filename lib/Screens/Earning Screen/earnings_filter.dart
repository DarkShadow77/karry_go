import 'package:flutter/material.dart';
import 'package:karry_go/utils/colors.dart';

class EarningsFilter extends StatelessWidget {
  const EarningsFilter({
    Key? key,
    required this.monthPress,
    required this.dayPress,
    required this.size,
  }) : super(key: key);

  final VoidCallback monthPress;
  final Size size;
  final VoidCallback dayPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.184,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            height: size.height * 0.11,
            width: size.width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 8),
                  width: size.width * 0.1,
                  height: size.height * 0.045,
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: monthPress,
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.subWhite,
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      minimumSize: Size(size.width * 1, size.height * 0.045),
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: "Monthly",
                        style: TextStyle(
                          fontFamily: "DM Sans",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: AppColors.subWhite2,
                  thickness: 1,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  width: size.width * 0.1,
                  alignment: Alignment.center,
                  height: size.height * 0.045,
                  child: TextButton(
                    onPressed: dayPress,
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.subWhite,
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      minimumSize: Size(size.width * 1, size.height * 0.045),
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: "Daily",
                        style: TextStyle(
                          fontFamily: "DM Sans",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.012,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: AppColors.subWhite,
                alignment: Alignment.center,
                minimumSize: Size(size.width * 1, size.height * 0.06),
              ),
              child: RichText(
                text: const TextSpan(
                  text: "Cancel",
                  style: TextStyle(
                    fontFamily: "DM Sans",
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xffeb5757),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
