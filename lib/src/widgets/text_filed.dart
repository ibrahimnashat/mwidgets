// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/consts/font_families.dart';
import 'package:mwidgets/src/extensions/context.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/extensions/widget.dart';
import 'package:mwidgets/src/widgets/text.dart';

import '../consts/font_sizes.dart';

class MTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLength;
  final Color? fillColor;
  String? hintText;
  final String? lableText;
  final String? title;
  final double textSize;
  final Color? hintColor;
  final Color textColor;
  final Color titleColor;
  String? fontFamily;
  final double paddingHorizontal;
  final double paddingVertical;
  Widget? suffix;
  Widget? prefix;
  Widget? outterPrefix;
  InputBorder? border;
  final bool enabled, readOnly, showCursor;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final TextInputType keyboardType;
  final int? maxLines;
  final bool obscureText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  Color? activeBorderColor;
  List<TextInputFormatter>? inputFiltering;
  final TextAlign textAlign;
  final TextDecoration? textDecoration;
  final Key? mKey;
  final FontWeight? titleWeight;

  final String? Function(String? valid)? validator;

  MTextFiled({
    super.key,
    this.mKey,
    this.textAlign = TextAlign.start,
    this.validator,
    this.controller,
    this.inputFiltering,
    this.outterPrefix,
    this.titleWeight,
    this.textInputAction,
    this.focusNode,
    this.border,
    this.maxLength,
    this.fillColor,
    this.lableText,
    this.suffix,
    this.onEditingComplete,
    this.textDecoration,
    this.prefix,
    this.title,
    this.hintText,
    this.fontFamily,
    this.hintColor,
    this.textColor = Colors.black,
    this.titleColor = Colors.black,
    this.textSize = FoontSize.font19,
    this.paddingHorizontal = 21.0,
    this.paddingVertical = 20.0,
    this.enabled = true,
    this.showCursor = true,
    this.readOnly = false,
    this.keyboardType = TextInputType.name,
    this.maxLines = 1,
    this.obscureText = false,
    this.onChanged,
    this.activeBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    inputFiltering ??= [];
    fontFamily ??= context.isEn ? FoontFamily.enFont : FoontFamily.arFont;
    activeBorderColor ??= Coolors.primaryColor;
    hintColor ??= Coolors.highlight2;
    if (hintText == 'null') hintText = null;
    border ??= OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: Coolors.highlight,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          MText(
            text: title,
            size: textSize,
            weight: titleWeight ?? FontWeight.w400,
            color: titleColor,
          ).addPadding(bottom: 16.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: textAlign == TextAlign.left
              ? TextDirection.ltr
              : TextDirection.rtl,
          children: [
            if (outterPrefix != null)
              outterPrefix!.addPadding(
                top: 12.0,
                right: textAlign == TextAlign.left ? 21.0 : 0,
                end: textAlign == TextAlign.left ? 0 : 21.0,
              ),
            Expanded(
              child: TextFormField(
                key: mKey,
                onTapOutside: (event) {
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                },
                showCursor: showCursor,
                readOnly: readOnly,
                textInputAction: textInputAction,
                onEditingComplete: onEditingComplete,
                focusNode: focusNode,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                enableSuggestions: true,
                textAlign: textAlign,
                textAlignVertical: TextAlignVertical.top,
                controller: controller,
                enabled: enabled,
                onChanged: onChanged,
                keyboardType: keyboardType,
                maxLines: maxLines,
                obscureText: obscureText,
                cursorColor: Coolors.primaryColor,
                cursorHeight: textSize * 1.4,
                validator: validator,
                inputFormatters: inputFiltering
                  ?..add(LengthLimitingTextInputFormatter(maxLength)),
                style: TextStyle(
                  fontSize: textSize,
                  color: textColor,
                  fontFamily: fontFamily,
                  decoration: textDecoration,
                ),
                decoration: InputDecoration(
                  focusedBorder: border?.copyWith(
                    borderSide: BorderSide(
                      color: activeBorderColor!,
                      width: 1.5,
                    ),
                  ),
                  labelStyle: TextStyle(
                    fontSize: textSize,
                    fontFamily: fontFamily,
                    color: Coolors.grey,
                    decoration: textDecoration,
                  ),
                  border: border,
                  enabledBorder: border,
                  disabledBorder: border,
                  suffixIcon: suffix?.mNotStratch,
                  prefixIcon: prefix?.mNotStratch.addPadding(start: 12),
                  filled: fillColor != null,
                  fillColor: fillColor,
                  hintText: hintText,
                  labelText: lableText,
                  hintStyle: TextStyle(
                    fontSize: textSize - 2,
                    color: hintColor,
                    fontFamily: fontFamily,
                    decoration: textDecoration,
                  ),
                  contentPadding: EdgeInsetsDirectional.only(
                    start: paddingHorizontal,
                    end: paddingHorizontal,
                    bottom: paddingVertical,
                    top: paddingVertical,
                  ),
                ),
              ),
            ),
          ],
        ).addPadding(horizontal: 2.0),
      ],
    );
  }
}
