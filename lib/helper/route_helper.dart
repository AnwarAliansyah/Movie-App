import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';

import 'package:get/get.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/movie_detail.dart';
import 'package:movie_app/pages/no_internet_page.dart';
import 'package:movie_app/pages/personal_page.dart';
import 'package:movie_app/pages/splash_screen.dart';

class RouteHelper {
  static const String splashScreen = "/splash-screen";
  static const String noInternetPage = "/no-internet-screen";
  static const String home = "/";
  static const String movieDetail = "/detail-movie";
  static const String personalPage = "/personal-page";

  static String getSplashScreen() => "$splashScreen";
  static String getNoInternetPage() => "$noInternetPage";
  static String getHome() => "$home";
  static String getDetailMovie() => "$movieDetail";
  static String getPersonalPage(String? initial) =>
      "$personalPage?initial=$initial";

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: noInternetPage, page: () => NoInternetPage()),
    GetPage(
        name: home,
        page: () {
          return HomePage();
        }),
    GetPage(name: movieDetail, page: () => MovieDetailPage()),
    GetPage(
        name: personalPage,
        page: () {
          var initial = Get.parameters["initial"];
          return PersonalPage(
            initial: initial!,
          );
        }),
  ];
}
