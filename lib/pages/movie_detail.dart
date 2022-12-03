import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/app_constraints.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/dimensions.dart';
import 'package:movie_app/model/movie_detail_model.dart';
import 'package:movie_app/widgets/app_large_text.dart';
import 'package:movie_app/widgets/app_text.dart';
import 'package:movie_app/widgets/image_container.dart';
import 'package:movie_app/widgets/loading_page.dart';
import 'package:movie_app/widgets/text_icon.dart';
import 'package:url_launcher/link.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String spokenLanguge() {
      List language = [];
      List<SpokenLanguage>? spokenLanguage =
          Get.find<MovieController>().movieDetail.spokenLanguages;
      for (var lang in spokenLanguage!) {
        language.add(lang.englishName);
      }

      return language.join(", ");
    }

    return GetBuilder<MovieController>(builder: (detail) {
      DateFormat dateFormat = DateFormat.yMMMMd('en_US');

      return Scaffold(
        backgroundColor: AppConstraints.darkestColor,
        body: detail.isLoaded
            ? Stack(
                children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              AppConstraints.darkestColor.withOpacity(.4),
                              AppConstraints.darkestColor.withOpacity(.8),
                              AppConstraints.darkestColor.withOpacity(.9),
                              AppConstraints.darkestColor,
                            ],
                          ),
                        ),
                        width: Dimensions.sW,
                        child: AspectRatio(
                          aspectRatio: 8 / 12,
                          child: ClipRRect(
                            child: Image.network(
                              AppConstraints.IMAGE_BASE_URL +
                                  "original" +
                                  detail.movieDetail.posterPath!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      top: Dimensions.size10 * 4,
                      left: Dimensions.size10 * 2,
                      right: Dimensions.size10 * 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              width: Dimensions.size10 * 3.5,
                              height: Dimensions.size10 * 3.5,
                              decoration: BoxDecoration(
                                color: AppConstraints.darkestColor,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.size10 * 5),
                              ),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: AppConstraints.textColorWhite,
                                size: Dimensions.size10 * 1.8,
                              ),
                            ),
                          ),
                          detail.movieDetail.homepage != null
                              ? Link(
                                  target: LinkTarget.blank,
                                  uri: Uri.parse(detail.movieDetail.homepage!),
                                  builder: ((context, followLink) {
                                    return InkWell(
                                      onTap: followLink,
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Dimensions.size10 * 1.5),
                                          height: Dimensions.size10 * 3.5,
                                          decoration: BoxDecoration(
                                            color: AppConstraints.darkestColor,
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.size10 * 2),
                                          ),
                                          child: Row(
                                            children: [
                                              AppLargeText(
                                                size: Dimensions.size10 * 1.3,
                                                text: "Official",
                                                color: AppConstraints
                                                    .textColorWhite,
                                              ),
                                              SizedBox(
                                                width: Dimensions.size10 / 2,
                                              ),
                                              Icon(
                                                Icons.launch_rounded,
                                                color: AppConstraints
                                                    .textColorWhite,
                                                size: Dimensions.size10 * 1.5,
                                              )
                                            ],
                                          )),
                                    );
                                  }),
                                )
                              : Container(),
                        ],
                      )),
                  Positioned(
                    top: Dimensions.sH * .4,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.size10 * 2,
                          vertical: Dimensions.size10 * 3),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              AppConstraints.darkestColor,
                              AppConstraints.darkestColor.withOpacity(.8),
                              AppConstraints.darkestColor.withOpacity(.5),
                              AppConstraints.darkestColor.withOpacity(0),
                            ],
                          ),
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(Dimensions.size10 * 2))),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                TextIcon(
                                  text: detail.movieDetail.voteAverage!
                                      .toStringAsFixed(1),
                                  isIcon: true,
                                  icon: Icons.star_rate_rounded,
                                  iconColor: Colors.amber,
                                ),
                                SizedBox(
                                  width: Dimensions.size10 * 1.5,
                                ),
                                TextIcon(
                                  text:
                                      "${detail.movieDetail.voteCount} reviews",
                                )
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.size10 * 2,
                            ),
                            AppLargeText(
                                size: Dimensions.size10 * 2.0,
                                text: detail.movieDetail.originalTitle!,
                                color: AppConstraints.textColorWhite),
                            SizedBox(
                              height: Dimensions.size10 * 2,
                            ),
                            Container(
                              height: Dimensions.size10 * 2.5,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: detail.movieDetail.genres!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          right: Dimensions.size10 * 1.5),
                                      child: TextIcon(
                                          text: detail.movieDetail
                                              .genres![index].name!),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: Dimensions.size10 * 2,
                            ),
                            AppText(
                              size: Dimensions.size10 * 1.3,
                              color: AppConstraints.textColorWhite,
                              text: detail.movieDetail.overview!,
                            ),
                            SizedBox(
                              height: Dimensions.size10 * 2,
                            ),
                            detail.movieDetail.belongsToCollection != null
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppLargeText(
                                        size: Dimensions.size10 * 1.4,
                                        color: AppConstraints.textColorWhite,
                                        text: "Collection",
                                      ),
                                      SizedBox(
                                        height: Dimensions.size10,
                                      ),
                                      Container(
                                        height: Dimensions.size10 * 10,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 1,
                                          itemBuilder: (context, index) {
                                            return ImageContainer(
                                              height: Dimensions.size10 * 10,
                                              endpoint: AppConstraints
                                                      .IMAGE_BASE_URL +
                                                  "w500" +
                                                  detail.movieDetail
                                                          .belongsToCollection[
                                                      "poster_path"],
                                              radius: Dimensions.size10,
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: Dimensions.size10 * 2,
                                      ),
                                    ],
                                  )
                                : Container(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLargeText(
                                  size: Dimensions.size10 * 1.4,
                                  text: "Details",
                                  color: AppConstraints.textColorWhite,
                                ),
                                SizedBox(
                                  height: Dimensions.size10 * 2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      size: Dimensions.size10 * 1.3,
                                      text: "Release Date",
                                      color: AppConstraints.textColorWhite,
                                    ),
                                    AppText(
                                      size: Dimensions.size10 * 1.3,
                                      text: dateFormat.format(
                                          detail.movieDetail.releaseDate!),
                                      color: AppConstraints.textColorWhite,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions.size10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      size: Dimensions.size10 * 1.3,
                                      text: "Status",
                                      color: AppConstraints.textColorWhite,
                                    ),
                                    AppText(
                                      size: Dimensions.size10 * 1.3,
                                      text: detail.movieDetail.status!,
                                      color: AppConstraints.textColorWhite,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions.size10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      size: Dimensions.size10 * 1.3,
                                      text: "Runtime",
                                      color: AppConstraints.textColorWhite,
                                    ),
                                    AppText(
                                      size: Dimensions.size10 * 1.3,
                                      text:
                                          detail.movieDetail.runtime.toString(),
                                      color: AppConstraints.textColorWhite,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions.size10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      size: Dimensions.size10 * 1.3,
                                      text: "Language Spoken",
                                      color: AppConstraints.textColorWhite,
                                    ),
                                    Container(
                                      width: Dimensions.sW * .4,
                                      child: AppText(
                                        size: Dimensions.size10 * 1.3,
                                        text: spokenLanguge(),
                                        textAlign: TextAlign.right,
                                        color: AppConstraints.textColorWhite,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions.size10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      size: Dimensions.size10 * 1.3,
                                      text: "Tagline",
                                      color: AppConstraints.textColorWhite,
                                    ),
                                    Container(
                                      width: Dimensions.sW * .5,
                                      child: AppText(
                                        size: Dimensions.size10 * 1.3,
                                        text: detail.movieDetail.tagline!,
                                        textAlign: TextAlign.right,
                                        color: AppConstraints.textColorWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.size10 * 2,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLargeText(
                                  size: Dimensions.size10 * 1.4,
                                  text: "Production Companies",
                                  color: AppConstraints.textColorWhite,
                                ),
                                SizedBox(
                                  height: Dimensions.size10 * 2,
                                ),
                                Container(
                                  height: Dimensions.size10 * 5,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: detail.movieDetail
                                        .productionCompanies!.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          margin: EdgeInsets.only(
                                              right: Dimensions.size10),
                                          color: detail
                                                      .movieDetail
                                                      .productionCompanies![
                                                          index]
                                                      .logoPath !=
                                                  null
                                              ? AppConstraints.textColorWhite
                                              : Colors.transparent,
                                          child: detail
                                                      .movieDetail
                                                      .productionCompanies![
                                                          index]
                                                      .logoPath !=
                                                  null
                                              ? Image.network(AppConstraints
                                                      .IMAGE_BASE_URL +
                                                  "w500" +
                                                  detail
                                                      .movieDetail
                                                      .productionCompanies![
                                                          index]
                                                      .logoPath!)
                                              : Center(
                                                  child: AppLargeText(
                                                      color: AppConstraints
                                                          .textColorWhite,
                                                      size: Dimensions.size10 *
                                                          1.3,
                                                      text: detail
                                                          .movieDetail
                                                          .productionCompanies![
                                                              index]
                                                          .name!),
                                                ));
                                    },
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.size10 * 2,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLargeText(
                                  size: Dimensions.size10 * 1.4,
                                  text: "Production Countries",
                                  color: AppConstraints.textColorWhite,
                                ),
                                SizedBox(
                                  height: Dimensions.size10 * 2,
                                ),
                                Container(
                                  height: Dimensions.size10 * 2.5,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: detail.movieDetail
                                        .productionCountries!.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          margin: EdgeInsets.only(
                                              right: Dimensions.size10),
                                          child: TextIcon(
                                              text: detail
                                                  .movieDetail
                                                  .productionCountries![index]
                                                  .name!));
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                  color: AppConstraints.textColorWhite,
                ),
              ),
      );
    });
  }
}
