import 'package:flutter/material.dart';
import 'package:karry_go/utils/colors.dart';
import 'package:karry_go/utils/currency.dart';

class TransactionsTab extends StatelessWidget {
  const TransactionsTab({
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
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.0083,
      ),
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
              style: TextStyle(
                fontSize: 12,
                color: AppColors.subBlack,
                fontWeight: FontWeight.w700,
              ),
              children: [
                TextSpan(
                  text: getCurrency(),
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: "${price}",
                  style: TextStyle(
                    fontFamily: "DM Sans",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
