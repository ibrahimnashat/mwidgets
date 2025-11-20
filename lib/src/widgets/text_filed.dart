// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/consts/font_families.dart';
import 'package:mwidgets/src/extensions/context.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/widgets/text.dart';

import '../consts/font_sizes.dart';

class MTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLength, maxLines;
  final String? lableText, title;
  final double textSize, hintSize, titleSize, labelSize;
  String? hintText, fontFamily;
  Color? hintColor, labelColor, fillColor, activeBorderColor;
  final Color textColor, titleColor;
  final EdgeInsetsGeometry? titlePadding, contentPadding;
  Widget? suffix, prefix, outterPrefix;
  InputBorder? border;
  final bool enabled, readOnly, showCursor, obscureText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  List<TextInputFormatter>? inputFiltering;
  final TextAlign textAlign;
  final TextDecoration? textDecoration;
  final Key? mKey;
  final FontWeight? titleWeight, lableWeight, textWeight, hintWeight;
  final TextStyle? hintStyle, labelStyle, textStyle, titleStyle;
  final String? Function(String? valid)? validator;
  final void Function(PointerDownEvent data)? onTapOutside;
  final Function? onTap;
  final bool showRequired;

  MTextFiled({
    super.key,
    this.mKey,
    this.onTap,
    this.hintStyle,
    this.onTapOutside,
    this.labelStyle,
    this.textStyle,
    this.titleStyle,
    this.textAlign = TextAlign.start,
    this.validator,
    this.controller,
    this.inputFiltering,
    this.lableWeight,
    this.textWeight,
    this.hintWeight,
    this.outterPrefix,
    this.titleWeight,
    this.textInputAction,
    this.focusNode,
    this.border,
    this.titlePadding,
    this.maxLength,
    this.showRequired = false,
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
    this.labelColor = Colors.grey,
    this.titleColor = Colors.black,
    this.textSize = FoontSize.font19,
    this.titleSize = FoontSize.font19,
    this.labelSize = FoontSize.font19,
    this.hintSize = FoontSize.font17,
    this.contentPadding = const MPadding.set(horizontal: 21.0, vertical: 20.0),
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
    activeBorderColor ??= Coolors.primaryColor;
    hintColor ??= Coolors.highlight2;
    if (hintText == 'null') hintText = null;
    fontFamily ??= context.isEn ? FoontFamily.enFont : FoontFamily.arFont;
    border ??= OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Coolors.highlight),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Padding(
            padding: titlePadding ?? const MPadding.set(bottom: 16.0),
            child: Row(
              spacing: 2.0,
              children: [
                MText(
                  text: title,
                  size: titleSize,
                  weight: titleWeight ?? FontWeight.w400,
                  color: titleColor,
                  style: titleStyle,
                ),
                if (showRequired)
                  MText(
                    text: '*',
                    size: titleSize,
                    weight: titleWeight ?? FontWeight.w400,
                    color: Colors.red,
                    style: titleStyle,
                  ),
              ],
            ),
          ),
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
                  if (onTapOutside != null) {
                    onTapOutside!(event);
                  } else {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  }
                },
                onTap: () {
                  if (onTap != null) {
                    onTap!();
                  }
                },
                showCursor: showCursor,
                readOnly: readOnly,
                textInputAction: textInputAction,
                onEditingComplete: onEditingComplete,
                focusNode: focusNode,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                enableSuggestions: true,
                textAlign: textAlign,
                textAlignVertical: TextAlignVertical.center,
                controller: controller,
                enabled: enabled,
                onChanged: onChanged,
                keyboardType: keyboardType,
                maxLines: maxLines,
                obscureText: obscureText,
                cursorColor: Coolors.primaryColor,
                cursorHeight: textSize,
                validator: validator,
                inputFormatters: inputFiltering
                  ?..add(LengthLimitingTextInputFormatter(maxLength)),
                style: textStyle ??
                    TextStyle(
                      fontSize: textSize,
                      color: textColor,
                      fontFamily: fontFamily,
                      decoration: textDecoration,
                      fontWeight: textWeight,
                    ),
                decoration: InputDecoration(
                  focusedBorder: border?.copyWith(
                    borderSide: BorderSide(
                      color: activeBorderColor!,
                      width: 1.5,
                    ),
                  ),
                  labelStyle: labelStyle ??
                      TextStyle(
                        fontSize: labelSize,
                        fontFamily: fontFamily,
                        color: labelColor,
                        decoration: textDecoration,
                        fontWeight: lableWeight,
                      ),
                  border: border,
                  enabledBorder: border,
                  disabledBorder: border,
                  suffixIcon: suffix != null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [suffix!],
                        )
                      : null,
                  prefixIcon: prefix != null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [prefix!],
                        )
                      : null,
                  filled: fillColor != null,
                  fillColor: fillColor,
                  hintText: hintText,
                  labelText: lableText,
                  hintStyle: hintStyle ??
                      TextStyle(
                        fontSize: hintSize,
                        color: hintColor,
                        fontFamily: fontFamily,
                        decoration: textDecoration,
                        fontWeight: hintWeight,
                      ),
                  contentPadding: contentPadding,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
