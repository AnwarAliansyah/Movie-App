import 'package:flutter/material.dart';
import 'package:movie_app/app_constraints.dart';
import 'package:movie_app/dimensions.dart';
import 'package:movie_app/helper/route_helper.dart';
import 'package:movie_app/widgets/app_text.dart';
import 'package:movie_app/widgets/text_icon.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstraints.darkestColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.size10 * 2),
        height: Dimensions.sH,
        width: Dimensions.sW,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: Dimensions.size10 * 10,
              color: AppConstraints.textColorWhite,
            ),
            SizedBox(
              height: Dimensions.size10 * 2,
            ),
            AppText(
                size: Dimensions.size10 * 1.5,
                color: AppConstraints.textColorWhite,
                text: "Something went wrong"),
            SizedBox(
              height: Dimensions.size10 * 3,
            ),
            AppText(
                textAlign: TextAlign.center,
                size: Dimensions.size10 * 1.2,
                color: AppConstraints.textColorWhite,
                text:
                    "Try to check your internet connection and try again later"),
          ],
        ),
      ),
    );
  }
}
