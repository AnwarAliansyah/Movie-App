import 'package:flutter/material.dart';
import 'package:movie_app/app_constraints.dart';
import 'package:movie_app/dimensions.dart';
import 'package:movie_app/widgets/app_text.dart';

class TextIcon extends StatelessWidget {
  bool? isIcon;
  Color? color;
  Color? iconColor;
  double? size;
  String text;
  IconData? icon;

  TextIcon({
    Key? key,
    this.isIcon = false,
    this.color = const Color(0xffeceded),
    this.iconColor,
    this.size = 0,
    required this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.size10 / 2, horizontal: Dimensions.size10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.size10 * 2),
          color: AppConstraints.textColorWhite),
      child: isIcon!
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: Dimensions.size10 * 1.1,
                  color: iconColor,
                ),
                SizedBox(
                  width: Dimensions.size10 / 2,
                ),
                AppText(
                    size: size == 0 ? Dimensions.size10 * 1.2 : size!,
                    text: text),
              ],
            )
          : AppText(
              size: size == 0 ? Dimensions.size10 * 1.2 : size!, text: text),
    );
  }
}
