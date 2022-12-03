import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app_constraints.dart';
import 'package:movie_app/dimensions.dart';
import 'package:movie_app/widgets/app_large_text.dart';
import 'package:movie_app/widgets/app_text.dart';
import 'package:movie_app/widgets/text_icon.dart';
import 'package:url_launcher/link.dart';

class PersonalPage extends StatelessWidget {
  String initial;

  PersonalPage({Key? key, required this.initial}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstraints.darkestColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.sH * .4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/bg.jpg"),
              )),
            ),
          ),
          initial == "photo"
              ? Positioned(
                  top: Dimensions.size10 * 4,
                  left: Dimensions.size10 * 2,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: Dimensions.size10 * 3.5,
                      height: Dimensions.size10 * 3.5,
                      decoration: BoxDecoration(
                        color: AppConstraints.darkestColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.size10 * 5),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppConstraints.textColorWhite,
                        size: Dimensions.size10 * 2,
                      ),
                    ),
                  ))
              : Container(),
          Positioned(
              top: Dimensions.sH * .3 - Dimensions.size10 * 6,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      top: Dimensions.size10 * 6,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.only(
                          top: Dimensions.size10 * 7,
                          left: Dimensions.size10 * 2,
                          right: Dimensions.size10 * 2,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(Dimensions.size10 * 2))),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                  size: Dimensions.size10 * 1.6,
                                  text: "Hi,",
                                  color: AppConstraints.textColorWhite),
                              AppLargeText(
                                  size: Dimensions.size10 * 2.1,
                                  color: Colors.white,
                                  text: "I am Anwar Aliansyah"),
                              SizedBox(
                                height: Dimensions.size10,
                              ),
                              AppText(
                                  size: Dimensions.size10 * 1.5,
                                  text: AppConstraints.about1,
                                  color: AppConstraints.textColorWhite),
                              SizedBox(
                                height: Dimensions.size10,
                              ),
                              AppText(
                                  size: Dimensions.size10 * 1.5,
                                  text: AppConstraints.about2,
                                  color: AppConstraints.textColorWhite),
                              SizedBox(
                                height: Dimensions.size10 * 2,
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    AppLargeText(
                                        color: AppConstraints.textColorWhite,
                                        size: Dimensions.size10 * 1.5,
                                        text: "Contact Me"),
                                    SizedBox(
                                      height: Dimensions.size10 * 1.5,
                                    ),
                                    Container(
                                      width: Dimensions.sW * .5,
                                      child: TextIcon(
                                        isIcon: true,
                                        icon: Icons.whatsapp_rounded,
                                        text: "+62 856 4946 9009",
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.size10 * 1.5,
                                    ),
                                    Container(
                                      width: Dimensions.sW * .5,
                                      child: TextIcon(
                                        isIcon: true,
                                        icon: Icons.email_rounded,
                                        text: "aaliansyah22@gmail.com",
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.size10 * 1.5,
                                    ),
                                    Container(
                                      child: TextIcon(
                                        text: "LinkedIn : Anwar Aliansyah",
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: Dimensions.size10 * 12,
                        width: Dimensions.size10 * 12,
                        decoration: BoxDecoration(
                            color: AppConstraints.darkestColor,
                            image: DecorationImage(
                              image: AssetImage("assets/photo/photo.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.circular(Dimensions.size10 * 2)),
                      ),
                    ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
