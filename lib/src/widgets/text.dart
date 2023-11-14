// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mwidgets/mwidgets.dart';
import 'package:mwidgets/src/consts/font_families.dart';

class MText extends StatelessWidget {
  final String? text;
  final Color color;
  final double size;
  String? fontFamily;
  final int? maxLines;
  final TextAlign? align;
  final double? maxWidth;
  final TextDecoration decoration;
  final FontWeight? weight;
  final Key? mKey;

  MText({
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
    this.decoration = TextDecoration.none,
  }) : super(key: key) {
    ttext = (text ?? "").replaceAll('null', '');
  }

  late String ttext;

  @override
  Widget build(BuildContext context) {
    fontFamily ??= context.isEn ? FoontFamily.enFont : FoontFamily.arFont;
    return SizedBox(
      key: mKey,
      width: maxWidth,
      child: Text(
        ttext,
        style: TextStyle(
          color: color,
          fontFamily: fontFamily,
          fontSize: size,
          decoration: decoration,
          decorationStyle: TextDecorationStyle.solid,
          decorationThickness: 1.4,
          height: 1.3,
          fontWeight: weight ?? FontWeight.w300,
        ),
        maxLines: maxLines,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
        textAlign: align,
      ),
    );
  }
}

// typedef TextBuilder = String Function(
//   bool opertion,
//   String result1,
//   String result2,
// );
