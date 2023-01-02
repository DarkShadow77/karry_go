import 'package:flutter/material.dart';

class Circles extends StatelessWidget {
  const Circles({
    Key? key,
    required this.size,
    required this.color,
    this.child,
    required this.height,
    required this.width,
  }) : super(key: key);

  final Size size;
  final Color color;
  final Widget? child;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height,
          width: width,
          padding: EdgeInsets.all(27),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                color == Colors.black
                    ? Color(0xff434343).withOpacity(0.20)
                    : Color(0xffdadada).withOpacity(0.20),
                color == Colors.black
                    ? Color(0xff121212).withOpacity(0.20)
                    : Color(0xfff2f2f2).withOpacity(0.20),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(35),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  color == Colors.black
                      ? Color(0xff434343).withOpacity(0.20)
                      : Color(0xffdadada).withOpacity(0.20),
                  color == Colors.black
                      ? Color(0xff121212).withOpacity(0.20)
                      : Color(0xfff2f2f2).withOpacity(0.20),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    color == Colors.black
                        ? Color(0xff434343).withOpacity(0.20)
                        : Color(0xffdadada).withOpacity(0.20),
                    color == Colors.black
                        ? Color(0xff121212).withOpacity(0.20)
                        : Color(0xfff2f2f2).withOpacity(0.20),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: child,
            ),
          ),
        )
      ],
    );
  }
}
