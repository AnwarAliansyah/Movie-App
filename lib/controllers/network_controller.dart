import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/helper/route_helper.dart';
import 'package:movie_app/pages/no_internet_page.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late ConnectivityResult _connectivityResult;

  late StreamSubscription<ConnectivityResult> _streamSubscription;

  @override
  void onInit() async {
    super.onInit();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      print("none1");

      Get.offNamed(RouteHelper.getNoInternetPage());
    } else {
      if (Get.currentRoute == RouteHelper.getNoInternetPage() &&
          Get.find<MovieController>().movieList.isEmpty) {
        print("can1");

        Get.offNamed(RouteHelper.getSplashScreen());
      } else if (Get.currentRoute == RouteHelper.getNoInternetPage()) {
        print("can2");

        Get.offNamed(RouteHelper.getHome());
      }
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _streamSubscription.cancel();
  }
}
