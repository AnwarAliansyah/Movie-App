import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/app_constraints.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/dimensions.dart';
import 'package:movie_app/helper/route_helper.dart';
import 'package:movie_app/model/genre_model.dart';
import 'package:movie_app/pages/movie_detail.dart';
import 'package:movie_app/widgets/app_large_text.dart';
import 'package:movie_app/widgets/app_text.dart';
import 'package:movie_app/widgets/text_icon.dart';

class ListViewScreen extends StatelessWidget {
  bool isSeeAll;

  ListViewScreen({
    Key? key,
    required this.isSeeAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
      builder: (movie) {
        return movie.isLoaded
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: isSeeAll ? movie.movieList.length : 5,
                itemBuilder: ((context, index) {
                  List genre = [];

                  String getGenre() {
                    List<GenreModel>? genreModel =
                        Get.find<MovieController>().genreList;

                    for (var i = 0;
                        i < movie.movieList[index].genreIds!.length;
                        i++) {
                      for (var gen in genreModel) {
                        if (movie.movieList[index].genreIds![i] == gen.id) {
                          genre.add(gen.name);
                        }
                      }
                    }

                    return genre.join(", ");
                  }

                  return GestureDetector(
                    onTap: () {
                      movie.getMovieDetail(
                          movie.movieList[index].id, _callback);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: Dimensions.size10 * 1.5),
                      height: Dimensions.size10 * 15,
                      child: Row(
                        children: [
                          Container(
                            height: Dimensions.size10 * 15,
                            child: AspectRatio(
                              aspectRatio: 8 / 12,
                              child: ClipRRect(
                                child: Image.network(
                                  AppConstraints.IMAGE_BASE_URL +
                                      "w500" +
                                      movie.movieList[index].posterPath!,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(
                                  Dimensions.size10 * 1.5,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                    foregroundDecoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomRight,
                                        end: Alignment.centerLeft,
                                        colors: [
                                          AppConstraints.darkestColor,
                                          AppConstraints.darkestColor
                                              .withOpacity(.9),
                                          AppConstraints.darkestColor
                                              .withOpacity(.5),
                                          AppConstraints.darkestColor
                                              .withOpacity(.5),
                                          AppConstraints.darkestColor
                                              .withOpacity(.5),
                                          AppConstraints.darkestColor
                                              .withOpacity(.9),
                                          AppConstraints.darkestColor,
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.size10 * 2),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                AppConstraints.IMAGE_BASE_URL +
                                                    "w500" +
                                                    movie.movieList[index]
                                                        .backdropPath!)))),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppConstraints.darkestColor
                                          .withOpacity(.7)),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: Dimensions.size10 * 2,
                                      ),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          AppLargeText(
                                            size: Dimensions.size10 * 1.4,
                                            text: movie.movieList[index]
                                                .originalTitle!,
                                            color:
                                                AppConstraints.textColorWhite,
                                          ),
                                          AppText(
                                            size: Dimensions.size10 * 1.1,
                                            text: getGenre(),
                                            color:
                                                AppConstraints.textColorWhite,
                                          ),
                                          Row(
                                            children: [
                                              TextIcon(
                                                  size: Dimensions.size10 * 1.1,
                                                  text: DateFormat.y().format(
                                                      movie.movieList[index]
                                                          .releaseDate!)),
                                              SizedBox(
                                                width: Dimensions.size10,
                                              ),
                                              TextIcon(
                                                  isIcon: true,
                                                  icon: Icons.language_rounded,
                                                  size: Dimensions.size10 * 1.1,
                                                  text: movie.movieList[index]
                                                      .originalLanguage!)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              TextIcon(
                                                size: Dimensions.size10 * 1.1,
                                                text: movie.movieList[index]
                                                    .voteAverage!
                                                    .toStringAsFixed(1),
                                                isIcon: true,
                                                icon: Icons.star_rate_rounded,
                                                iconColor: Colors.amber,
                                              ),
                                              SizedBox(
                                                width: Dimensions.size10,
                                              ),
                                              TextIcon(
                                                  isIcon: true,
                                                  icon:
                                                      Icons.rate_review_rounded,
                                                  size: Dimensions.size10 * 1.1,
                                                  text:
                                                      "${movie.movieList[index].voteCount}")
                                            ],
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }))
            : Container();
      },
    );
  }

  void _callback(bool isSuccess) {
    if (isSuccess) {
      Get.toNamed(RouteHelper.getDetailMovie());
    } else {
      Get.toNamed(RouteHelper.getNoInternetPage());
    }
  }
}
