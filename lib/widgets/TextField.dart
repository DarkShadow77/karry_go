import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:karry_go/utils/colors.dart';

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({
    Key? key,
    required this.controller,
    this.textInputAction,
    required this.hintText,
    this.warningMessage,
    required this.fieldBool,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final String hintText;
  final String? warningMessage;
  final bool fieldBool;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.subWhite,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.green, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: fieldBool ? Colors.red : AppColors.subWhite2, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.subWhite2, width: 1.0),
        ),
        contentPadding: EdgeInsets.all(14),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 13,
          fontFamily: "DM Sans",
          fontWeight: FontWeight.w400,
          color: AppColors.subWhite,
        ),
      ),
      style: TextStyle(
        fontSize: 13,
        color: AppColors.subWhite,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) => email != null && !EmailValidator.validate(email)
          ? warningMessage
          : null,
    );
  }
}

class TextFieldText extends StatelessWidget {
  const TextFieldText({
    Key? key,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    required this.hintText,
    this.warningMessage,
    required this.fieldBool,
    this.enabled = true,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final String hintText;
  final String? warningMessage;
  final bool fieldBool;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      cursorColor: AppColors.subWhite,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.green, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: fieldBool ? Colors.red : AppColors.subWhite2, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: fieldBool ? Colors.red : AppColors.subWhite2, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.subWhite2, width: 1.0),
        ),
        contentPadding: EdgeInsets.all(14),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 13,
          fontFamily: "DM Sans",
          fontWeight: FontWeight.w400,
          color: AppColors.subWhite,
        ),
      ),
      style: TextStyle(
        fontSize: 13,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w400,
        color: AppColors.subWhite,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (user) {
        if (user != null && user.length < 2) {
          return warningMessage;
        } else {
          return null;
        }
      },
    );
  }
}
