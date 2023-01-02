import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.color,
    required this.position,
  }) : super(key: key);

  final Color color;
  final position;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: position,
      children: [
        Text(
          "Kárry",
          style: TextStyle(
            fontSize: 34,
            color:
                color == Colors.black ? Color(0xfffafafa) : Color(0xff121212),
            fontFamily: "Clash Grotesk SemiBold",
          ),
        ),
        Text(
          "Go",
          style: TextStyle(
            fontSize: 34,
            fontFamily: "Space Grotesk",
            color: Color(0xff27ae60),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
