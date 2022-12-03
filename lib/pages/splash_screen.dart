import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app_constraints.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/controllers/network_controller.dart';
import 'package:movie_app/dimensions.dart';
import 'package:movie_app/helper/route_helper.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/main_page.dart';
import 'package:movie_app/pages/no_internet_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Connectivity _connectivity = Connectivity();
  late ConnectivityResult _connectivityResult;

  Future<void> _loadResources() async {
    await Get.find<MovieController>().getMovieList(_callback);
    await Get.find<MovieController>().getGenreList(_callback);
  }

  Future<void> _initConnectivity() async {
    try {
      _connectivityResult = await _connectivity.checkConnectivity();

      if (_connectivityResult == ConnectivityResult.none) {
        print("none");

        Get.toNamed(RouteHelper.getNoInternetPage());
      } else {
        print("here");
        _loadResources();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstraints.darkestColor,
      body: Container(
        height: Dimensions.sH,
        width: Dimensions.sW,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.black,
            AppConstraints.darkestColor,
          ],
        )),
        child: Center(
          child: Text(
            "Movie App",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: Dimensions.size10 * 2,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }

  void _callback(bool isSuccess) {
    if (isSuccess) {
      print("success");

      Timer(Duration(seconds: 3), () => Get.toNamed(RouteHelper.getHome()));
    } else {
      Get.toNamed(RouteHelper.getNoInternetPage());
    }
  }
}
