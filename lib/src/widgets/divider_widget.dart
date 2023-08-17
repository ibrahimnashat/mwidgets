import 'package:flutter/material.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/extensions/padding.dart';

class MDividerItemWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  const MDividerItemWidget({
    Key? key,
    this.padding = const MPadding.set(vertical: 18.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      width: double.infinity,
      color: Coolors.highLight,
      height: 1.2,
    );
  }
}
