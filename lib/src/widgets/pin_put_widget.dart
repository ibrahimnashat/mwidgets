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
  String? fontFamily;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? Function(String? valid)? validator;
  final Key? mKey;

  MPinput({
    Key? key,
    this.mKey,
    this.validator,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    fontFamily ??= FoontFamily.enFont;

    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: TextStyle(
        fontSize: textSize,
        color: textColor,
        fontFamily: fontFamily,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Coolors.grey),
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
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Coolors.primaryColor),
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
