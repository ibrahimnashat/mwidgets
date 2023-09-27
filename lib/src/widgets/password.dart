import 'package:flutter/material.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/extensions/widget.dart';
import 'package:mwidgets/src/widgets/image.dart';

import '../consts/svgs.dart';

class MPasswordWidget extends StatefulWidget {
  final Color? activeColor, unActiveColor;
  final double activeSize, unActiveSize;
  final Widget Function(Widget icon, bool hide) child;

  const MPasswordWidget({
    super.key,
    required this.child,
    this.activeColor,
    this.unActiveColor,
    this.activeSize = 30.0,
    this.unActiveSize = 30.0,
  });

  @override
  State<MPasswordWidget> createState() => _MPasswordWidgetState();
}

class _MPasswordWidgetState extends State<MPasswordWidget> {
  bool hide = true;

  @override
  Widget build(BuildContext context) {
    final icon = MSvg(
      name: hide ? Svgs.hide : Svgs.show,
      color: hide ? widget.unActiveColor : widget.activeColor,
      width: hide ? widget.unActiveSize : widget.activeSize,
      height: hide ? widget.unActiveSize : widget.activeSize,
    )
        .addPadding(
      horizontal: 20.0,
      vertical: 12.0,
    )
        .addAction(
      onGesture: () {
        setState(() {
          hide = !hide;
        });
      },
    );
    return widget.child(icon, hide);
  }
}
