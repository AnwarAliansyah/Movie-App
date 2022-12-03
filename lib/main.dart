import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:movie_app/app_constraints.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/controllers/network_controller.dart';
import 'package:movie_app/helper/route_helper.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/main_page.dart';
import 'package:movie_app/helper/dependencies.dart' as dependencies;
import 'package:movie_app/pages/movie_detail.dart';
import 'package:movie_app/pages/personal_page.dart';
import 'package:movie_app/pages/splash_screen.dart';

Future<void> main() async {
  await dependencies.init();
  initializeDateFormatting('en_EN', null).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(builder: (_) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Vegetables Market",
        // home: SplashScreen(),
        initialRoute: RouteHelper.getSplashScreen(),
        getPages: RouteHelper.routes,
      );
    });
  }
}
