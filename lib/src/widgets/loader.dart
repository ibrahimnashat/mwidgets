import 'package:flutter/material.dart';
import 'package:mwidgets/src/consts/jsons.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/extensions/radius.dart';
import 'package:mwidgets/src/widgets/image.dart';
import 'package:mwidgets/src/widgets/skeletons/skeletons.dart';

class Loader {
  static Widget loading({
    double width = 280.0,
    double height = 280.0,
  }) {
    return Center(
      child: MLottieImage(
        name: Jsons.loading,
        width: width,
        height: height,
      ),
    );
  }

  static Widget loadingSkeleton({
    double? height,
    double? width,
    MPadding padding = const MPadding.set(horizontal: 24.0, vertical: 12.0),
    MBorderRadius? borderRadius,
  }) {
    return Padding(
      padding: padding,
      child: SkeletonLine(
        style: SkeletonLineStyle(
          width: width,
          height: height,
          borderRadius: borderRadius ?? MBorderRadius.set(all: 16.0),
        ),
      ),
    );
  }

  static Widget loadingText({
    required double height,
    required double width,
    int count = 1,
    MPadding padding = const MPadding.set(horizontal: 24.0, vertical: 2.0),
  }) {
    return Padding(
      padding: padding,
      child: SkeletonParagraph(
        style: SkeletonParagraphStyle(
          lines: count,
          spacing: 6,
          lineStyle: SkeletonLineStyle(
            randomLength: true,
            height: height,
            borderRadius: BorderRadius.circular(5.0),
            maxLength: width,
            minLength: width * 0.7,
          ),
        ),
      ),
    );
  }
}
