import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color? color;

  AppLargeText(
      {Key? key,
      required this.size,
      this.color = Colors.black,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
      fontFamily: "Roboto",
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
