import 'package:flutter/material.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/consts/font_sizes.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/widgets/text.dart';

class MRadioItemWidget extends StatelessWidget {
  final int? value;
  final int? groupValue;
  final String? title;
  final Color fontColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final Widget? child;
  final bool selected;

  const MRadioItemWidget({
    Key? key,
    this.title,
    this.child,
    this.value,
    this.groupValue,
    this.fontWeight,
    this.selected = false,
    this.fontColor = Colors.black,
    this.fontSize = FoontSize.font20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final active = groupValue != null ? groupValue == value : selected;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 25.0,
          height: 25.0,
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: active ? Coolors.primaryColor : Coolors.highLight,
            ),
            shape: BoxShape.circle,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: active ? Coolors.primaryColor : Coolors.highLight,
              shape: BoxShape.circle,
            ),
          ),
        ).addPadding(end: 12.0),
        if (child != null) child!,
        if (title != null)
          MText(
            text: title,
            color: fontColor,
            size: fontSize,
            weight: fontWeight,
          )
      ],
    );
  }
}
