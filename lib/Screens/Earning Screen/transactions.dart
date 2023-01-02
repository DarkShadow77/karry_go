import 'package:flutter/material.dart';
import 'package:karry_go/Screens/Earning%20Screen/transactions_tab.dart';
import 'package:karry_go/utils/colors.dart';

class Transactions extends StatelessWidget {
  const Transactions({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.39,
      width: size.width * 1,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01185),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.0385,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: AppColors.subWhite2,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.0083,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  softWrap: true,
                  text: TextSpan(
                    text: "Transactions",
                    style: TextStyle(
                      fontFamily: "Clash Grotesk SemiBold",
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: AppColors.subWhite,
                  ),
                  child: RichText(
                    softWrap: true,
                    text: TextSpan(
                      text: "Show more",
                      style: TextStyle(
                        fontFamily: "DM Sans",
                        fontSize: 11,
                        decoration: TextDecoration.underline,
                        color: AppColors.subBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01185,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TransactionsTab(
                    size: size,
                    date: '2 days ago',
                    price: '53,000.00',
                    withdrawal: true,
                  ),
                  TransactionsTab(
                    size: size,
                    date: '2 days ago',
                    price: '5,000.00',
                    withdrawal: false,
                  ),
                  TransactionsTab(
                    size: size,
                    date: '2 days ago',
                    price: '21,000.00',
                    withdrawal: true,
                  ),
                  TransactionsTab(
                    size: size,
                    date: '2 days ago',
                    price: '2,300.00',
                    withdrawal: false,
                  ),
                  TransactionsTab(
                    size: size,
                    date: '2 days ago',
                    price: '10,000.00',
                    withdrawal: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
