// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mwidgets/mwidgets.dart';
import 'package:mwidgets/src/consts/pngs.dart';

class MSvg extends StatelessWidget {
  final String? name;
  final String? path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final Key? mkey;
  final AlignmentGeometry alignment;

  const MSvg({
    Key? key,
    this.mkey,
    this.name,
    this.path,
    this.height = 25,
    this.width = 25,
    this.fit = BoxFit.contain,
    this.color,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path ?? "assets/svgs/$name.svg",
      width: width,
      height: height,
      fit: fit,
      color: color,
      key: mkey,
    );
  }
}

class MAssetImage extends StatelessWidget {
  final String? name;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;
  final AlignmentGeometry alignment;

  const MAssetImage({
    Key? key,
    this.borderRadius = 0,
    this.name,
    this.height = 25,
    this.width = 25,
    this.fit = BoxFit.contain,
    this.color,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        "assets/pngs/$name.png",
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: Alignment.topCenter,
      ),
    );
  }
}

class MLottieImage extends StatelessWidget {
  final String? name;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;
  final AlignmentGeometry alignment;

  const MLottieImage({
    Key? key,
    this.borderRadius = 0,
    this.name,
    this.height = 25,
    this.width = 25,
    this.fit = BoxFit.contain,
    this.color,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Lottie.asset(
        "assets/jsons/$name.json",
        width: width,
        height: height,
        fit: fit,
        alignment: Alignment.topCenter,
      ),
    );
  }
}

class MFileImage extends StatelessWidget {
  final String file;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;
  final AlignmentGeometry alignment;

  const MFileImage({
    Key? key,
    this.borderRadius = 0,
    required this.file,
    this.height = 25,
    this.width = 25,
    this.fit = BoxFit.contain,
    this.color,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.file(
        File(file),
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: Alignment.topCenter,
      ),
    );
  }
}

class MNetworkImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;
  final bool hideLoader;
  final AlignmentGeometry alignment;

  const MNetworkImage({
    Key? key,
    this.borderRadius = 0,
    this.url = "",
    this.height = 25,
    this.width = 25,
    this.fit = BoxFit.contain,
    this.hideLoader = false,
    this.color,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url.contains('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: url,
          width: width,
          height: height,
          fit: fit,
          color: color,
          alignment: Alignment.center,
          errorWidget: (errorWidget, error, child) {
            return MAssetImage(
              name: Pngs.empty,
              width: width,
              height: height,
              fit: fit,
              color: color,
              borderRadius: borderRadius,
              alignment: alignment,
            );
          },
          placeholder: (context, provider) => hideLoader
              ? const SizedBox()
              : Loader.loadingSkeleton(
                  width: width,
                  height: height,
                  padding: const MPadding.set(),
                  borderRadius: MBorderRadius.set(all: borderRadius),
                ),
        ),
      );
    } else {
      return MAssetImage(
        name: Pngs.empty,
        width: width,
        height: height,
        fit: fit,
        color: color,
        borderRadius: borderRadius,
        alignment: alignment,
      );
    }
  }
}
