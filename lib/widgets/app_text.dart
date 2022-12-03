import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color? color;
  final TextAlign textAlign;

  AppText({
    Key? key,
    required this.size,
    this.color = Colors.black87,
    required this.text,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
      fontFamily: "Roboto",
        color: color,
        fontSize: size,
      ),
    );
  }
}
