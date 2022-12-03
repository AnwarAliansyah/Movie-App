import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:movie_app/app_constraints.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/dimensions.dart';
import 'package:movie_app/pages/main_page.dart';
import 'package:movie_app/pages/personal_page.dart';
import 'package:movie_app/widgets/loading_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List pages = [
    MainPage(),
    PersonalPage(
      initial: "home",
    ),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentBackPressTime = DateTime.now();

    Future<bool> showExitPopup() async {
      final difference = DateTime.now().difference(currentBackPressTime);
      final isExitWarning = difference >= Duration(seconds: 2);

      currentBackPressTime = DateTime.now();

      String message = "Again to exit";
      if (isExitWarning) {
        Fluttertoast.showToast(
            toastLength: Toast.LENGTH_SHORT,
            msg: message,
            backgroundColor: AppConstraints.textColorWhite,
            fontSize: Dimensions.size10 * 1.3,
            textColor: AppConstraints.darkestColor);

        return false;
      } else {
        Fluttertoast.cancel();
        return true;
      }
    }

    return WillPopScope(
        onWillPop: showExitPopup,
        child: Scaffold(
          backgroundColor: AppConstraints.darkestColor,
          body: pages[_selectedIndex],
          bottomNavigationBar: Container(
            height: Dimensions.size10 * 6,
            child: BottomNavigationBar(
              backgroundColor: AppConstraints.darkestColor,
              selectedItemColor: AppConstraints.textColorWhite,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 0.0,
              unselectedFontSize: 0.0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: _selectedIndex,
              onTap: onTapNav,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Account",
                ),
              ],
            ),
          ),
        ));
  }
}
