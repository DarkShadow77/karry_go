import 'package:flutter/material.dart';
import 'package:karry_go/utils/colors.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text, Size size) {
    if (text == null) return;

    final snackBar = SnackBar(
      padding:
          EdgeInsets.symmetric(horizontal: size.width * 0.08, vertical: 20),
      backgroundColor: AppColors.white,
      content: Text(
        text,
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w700,
        ),
      ),
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
