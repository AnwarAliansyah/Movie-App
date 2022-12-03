import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app_constraints.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/dimensions.dart';
import 'package:movie_app/helper/route_helper.dart';
import 'package:movie_app/pages/movie_detail.dart';
import 'package:movie_app/widgets/image_container.dart';

class GridViewScreen extends StatelessWidget {
  bool isSeeAll;

  GridViewScreen({
    Key? key,
    required this.isSeeAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(builder: (movie) {
      return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 130,
          childAspectRatio: 8 / 12,
          crossAxisSpacing: Dimensions.size10 / 2,
          mainAxisSpacing: Dimensions.size10 / 2,
        ),
        itemCount: isSeeAll ? 20 : 12,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              movie.getMovieDetail(movie.movieList[index].id, _callback);
              Get.toNamed(RouteHelper.getDetailMovie());
            },
            child: ImageContainer(
                height: Dimensions.size10 * 15,
                endpoint: "w500" + movie.movieList[index].posterPath!,
                radius: Dimensions.size10 * 1.5),
          );
        },
      );
    });
  }

  void _callback(bool isSuccess) {
    if (isSuccess) {
      Get.toNamed(RouteHelper.getDetailMovie());
    } else {
      Get.toNamed(RouteHelper.getNoInternetPage());
    }
  }
}
