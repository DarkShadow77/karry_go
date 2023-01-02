import 'package:flutter/material.dart';

class SignUpBars extends StatelessWidget {
  const SignUpBars({
    Key? key,
    required this.size,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
    required this.color5,
  }) : super(key: key);

  final Size size;
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width * 0.145,
          height: size.height * 0.006,
          decoration: BoxDecoration(
            color: color1,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          width: size.width * 0.145,
          height: size.height * 0.006,
          decoration: BoxDecoration(
            color: color2,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          width: size.width * 0.145,
          height: size.height * 0.006,
          decoration: BoxDecoration(
            color: color3,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          width: size.width * 0.145,
          height: size.height * 0.006,
          decoration: BoxDecoration(
            color: color4,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          width: size.width * 0.145,
          height: size.height * 0.006,
          decoration: BoxDecoration(
            color: color5,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
