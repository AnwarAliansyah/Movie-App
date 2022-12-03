import 'package:flutter/material.dart';
import 'package:movie_app/app_constraints.dart';
import 'package:movie_app/dimensions.dart';

class ImageContainer extends StatelessWidget {
  double? height;
  double? width;
  double? radius;
  String? endpoint;

  ImageContainer({
    Key? key,
    this.height,
    this.width,
    this.radius,
    this.endpoint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: AspectRatio(
        aspectRatio: 8 / 12,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            radius!,
          ),
          child: Image.network(
            AppConstraints.IMAGE_BASE_URL +
                endpoint!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
    ;
  }
}
