import 'package:flutter/material.dart';
import 'package:mwidgets/src/consts/font_sizes.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/widgets/divider_widget.dart';
import 'package:mwidgets/src/widgets/text.dart';

class MTitleDividerItemWidget extends StatelessWidget {
  final String title;
  final double textSize;

  const MTitleDividerItemWidget({
    super.key,
    required this.title,
    this.textSize = FoontSize.font18,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: MDividerItemWidget()),
        MText(
          text: title,
          size: textSize,
        ).addPadding(horizontal: 21.0),
        const Expanded(child: MDividerItemWidget()),
      ],
    );
  }
}
