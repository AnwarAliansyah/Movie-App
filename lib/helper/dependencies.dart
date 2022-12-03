import 'package:get/get.dart';
import 'package:movie_app/app_constraints.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/controllers/network_controller.dart';
import 'package:movie_app/data/api/api_client.dart';
import 'package:movie_app/repository/movie_repo.dart';

Future<void> init() async {
  //ApiClient
  Get.lazyPut(
    () => ApiClient(apiBaseUrl: AppConstraints.BASE_URL),
  );

  //Repo
  Get.lazyPut(() => MovieRepo(apiClient: Get.find()));

  //Controller
  Get.lazyPut(() => MovieController(movieRepo: Get.find()));

  //Network
  Get.put<NetworkController>(NetworkController(), permanent: true);
}
