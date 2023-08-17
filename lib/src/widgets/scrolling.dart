import 'package:flutter/material.dart';

class MScroll extends StatelessWidget {
  final Widget child;
  final Axis axis;
  final EdgeInsetsGeometry padding;
  const MScroll({
    Key? key,
    required this.child,
    this.axis = Axis.vertical,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding,
      scrollDirection: axis,
      physics: const BouncingScrollPhysics(),
      child: child,
    );
  }
}
