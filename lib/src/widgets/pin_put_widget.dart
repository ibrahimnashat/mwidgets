// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/consts/font_families.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/widgets/text.dart';
import 'package:pinput/pinput.dart';

import '../consts/font_sizes.dart';

class MPinput extends StatelessWidget {
  final TextEditingController? controller;
  final int length;
  final Color? fillColor;
  String? hintText;
  final String? lableText;
  final String? title;
  final double textSize;
  final Color hintColor;
  final Color textColor;
  final Color? activeColor;
  final Color? unActiveColor;
  String? fontFamily;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? Function(String? valid)? validator;
  final Key? mKey;
  final double width, height, borderRadius;

  MPinput({
    Key? key,
    this.mKey,
    this.validator,
    this.activeColor,
    this.unActiveColor,
    this.controller,
    this.textInputAction,
    this.focusNode,
    this.length = 5,
    this.fillColor,
    this.lableText,
    this.title,
    this.hintText,
    this.fontFamily,
    this.hintColor = Coolors.borderColor,
    this.textColor = Colors.black,
    this.textSize = FoontSize.font22,
    this.enabled = true,
    this.keyboardType = TextInputType.name,
    this.obscureText = false,
    this.onChanged,
    this.width = 60.0,
    this.height = 60.0,
    this.borderRadius = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    fontFamily ??= FoontFamily.enFont;

    final defaultPinTheme = PinTheme(
      width: width,
      height: height,
      textStyle: TextStyle(
        fontSize: textSize,
        color: textColor,
        fontFamily: fontFamily,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: unActiveColor ?? Coolors.grey),
        color: fillColor,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          MText(
            text: title,
            size: textSize,
            weight: FontWeight.w500,
            fontFamily: FoontFamily.enFont,
          ).addPadding(bottom: 12.0),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            key: mKey,
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(color: activeColor ?? Coolors.primaryColor),
                color: fillColor,
              ),
            ),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            autofocus: true,
            crossAxisAlignment: CrossAxisAlignment.center,
            showCursor: true,
            length: length,
            defaultPinTheme: defaultPinTheme,
            textInputAction: textInputAction,
            focusNode: focusNode,
            enableSuggestions: true,
            controller: controller,
            enabled: enabled,
            onChanged: onChanged,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
