import 'package:flutter/material.dart';
import 'package:mwidgets/src/consts/font_sizes.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/widgets/divider_widget.dart';
import 'package:mwidgets/src/widgets/text.dart';

class MTitleDividerItemWidget extends StatelessWidget {
  final String title;
  final double textSize, space;
  final TextStyle? style;
  final Color? color, textColor;

  const MTitleDividerItemWidget({
    super.key,
    required this.title,
    this.style,
    this.color,
    this.textColor,
    this.space = 21.0,
    this.textSize = FoontSize.font18,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MDividerItemWidget(
            color: color,
          ),
        ),
        MText(
          text: title,
          size: textSize,
          style: style,
          color: textColor ?? Colors.black,
        ).addPadding(horizontal: space),
        Expanded(
          child: MDividerItemWidget(
            color: color,
          ),
        ),
      ],
    );
  }
}
