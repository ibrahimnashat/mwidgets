// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mwidgets/mwidgets.dart';
import 'package:mwidgets/src/consts/font_families.dart';

class MText extends StatelessWidget {
  final String? text;
  final Color color;
  final double size;
  final String? fontFamily;
  final int? maxLines;
  final TextAlign? align;
  final double? maxWidth;
  final double? height;
  final TextDecoration decoration;
  final FontWeight? weight;
  final Key? mKey;
  final TextDirection? direction;

  const MText({
    Key? key,
    this.text = "",
    this.fontFamily,
    this.mKey,
    this.weight,
    this.color = Colors.black,
    this.size = FoontSize.font20,
    this.maxLines,
    this.align,
    this.maxWidth,
    this.height,
    this.direction,
    this.decoration = TextDecoration.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (maxWidth != null) {
      return ConstrainedBox(
        key: mKey,
        constraints: BoxConstraints(maxWidth: maxWidth!),
        child: mText(context),
      );
    } else {
      return mText(context);
    }
  }

  Widget mText(BuildContext context) {
    var text1 = (text ?? "").replaceAll('null', '');
    var font = fontFamily ??
        (isArabic(text1) ? FoontFamily.arFont : FoontFamily.enFont);
    return Text(
      text1,
      style: TextStyle(
        color: color,
        fontFamily: font,
        fontSize: size,
        decoration: decoration,
        decorationStyle: TextDecorationStyle.solid,
        decorationThickness: 1.4,
        height: height ?? 1.3,
        fontWeight: weight ?? FontWeight.w300,
      ),
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      textAlign: align,
      textDirection: direction,
    );
  }

  bool isArabic(String text) {
    // Arabic Unicode character ranges
    final arabicRegex = RegExp(
        r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]');

    // Check if the string contains Arabic characters
    return arabicRegex.hasMatch(text);
  }
}

// typedef TextBuilder = String Function(
//   bool opertion,
//   String result1,
//   String result2,
// );
