import 'package:flutter/material.dart';
import 'package:mwidgets/src/consts/font_sizes.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/widgets/divider_widget.dart';
import 'package:mwidgets/src/widgets/text.dart';

class MTitleDividerItemWidget extends StatelessWidget {
  final String title;
  final double textSize;
  final TextStyle? style;

  const MTitleDividerItemWidget({
    Key? key,
    required this.title,
    this.style,
    this.textSize = FoontSize.font18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: MDividerItemWidget()),
        MText(
          text: title,
          size: textSize,
          style: style,
        ).addPadding(horizontal: 21.0),
        const Expanded(child: MDividerItemWidget()),
      ],
    );
  }
}
