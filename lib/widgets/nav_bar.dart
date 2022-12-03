import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app_constraints.dart';
import 'package:movie_app/dimensions.dart';
import 'package:movie_app/helper/route_helper.dart';
import 'package:movie_app/pages/personal_page.dart';
import 'package:movie_app/widgets/app_text.dart';

class NavBar extends StatefulWidget {
  String viewType;
  Function()? onPressedView;

  NavBar({
    Key? key,
    required this.viewType,
    this.onPressedView,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.size10 * 2, vertical: Dimensions.size10),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              size: Dimensions.size10 * 1.4,
              text: "Hi, Hiring Team",
              color: AppConstraints.textColorWhite,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: widget.onPressedView,
                  icon: widget.viewType == "list"
                      ? Icon(
                          Icons.grid_view_rounded,
                        )
                      : Icon(Icons.list_rounded),
                  color: AppConstraints.textColorWhite,
                  iconSize: Dimensions.size10 * 2,
                ),
                SizedBox(
                  width: Dimensions.size10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getPersonalPage("photo"));
                  },
                  child: Container(
                    height: Dimensions.size10 * 3,
                    width: Dimensions.size10 * 3,
                    decoration: BoxDecoration(
                        color: AppConstraints.textColorWhite,
                        image: DecorationImage(
                            image: AssetImage("assets/photo/photo.jpg"),
                            fit: BoxFit.cover),
                        borderRadius:
                            BorderRadius.circular(Dimensions.size10 * 3)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Size get prefferedSize => Size(double.maxFinite, Dimensions.size10 * 7);
}
