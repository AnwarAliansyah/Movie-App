import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_app/app_constraints.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/dimensions.dart';
import 'package:movie_app/widgets/app_large_text.dart';
import 'package:movie_app/widgets/app_text.dart';
import 'package:movie_app/widgets/grid_view.dart';
import 'package:movie_app/widgets/list_view.dart';
import 'package:movie_app/widgets/loading_page.dart';
import 'package:movie_app/widgets/nav_bar.dart';
import 'package:movie_app/widgets/text_icon.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late String viewType;
  bool isSeeAll = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewType = "list";
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      backgroundColor: AppConstraints.darkestColor,
      body: Get.find<MovieController>().isLoaded
          ? NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      leading: Container(),
                      floating: true,
                      snap: true,
                      backgroundColor: AppConstraints.darkestColor,
                      flexibleSpace: NavBar(
                        viewType: viewType,
                        onPressedView: (() {
                          setState(() {
                            if (viewType == "list") {
                              viewType = "grid";
                            } else {
                              viewType = "list";
                            }
                            isSeeAll = false;
                          });
                        }),
                      ),
                    ),
                  ],
              body: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.size10 * 2,
                        right: Dimensions.size10 * 2),
                    height: Dimensions.size10 * 2.5,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppLargeText(
                            size: Dimensions.size10 * 1.5,
                            text: "Now Playing",
                            color: Colors.white,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isSeeAll = !isSeeAll;
                              });
                            },
                            child: AppText(
                              size: Dimensions.size10 * 1.2,
                              text: !isSeeAll ? "See All" : "Hide",
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.size10 * 3,
                      right: Dimensions.size10 * 2,
                      left: Dimensions.size10 * 2,
                    ),
                    child: viewType == "list"
                        ? ListViewScreen(
                            isSeeAll: isSeeAll,
                          )
                        : GridViewScreen(
                            isSeeAll: isSeeAll,
                          ),
                  ),
                ],
              ))
          : Center(
              child: CircularProgressIndicator(
                color: AppConstraints.textColorWhite,
              ),
            ),
    );
    // );
  }
}
