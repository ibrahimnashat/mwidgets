import 'package:flutter/material.dart';

extension SetPadding on Widget {
  Widget addPadding({
    final double all = 0.0,
    final double horizontal = 0.0,
    final double vertical = 0.0,
    final double start = 0.0,
    final double bottom = 0.0,
    final double end = 0.0,
    final double left = 0.0,
    final double right = 0.0,
    final double top = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.all(all),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: left, right: right),
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: start,
              bottom: bottom,
              end: end,
              top: top,
            ),
            child: this,
          ),
        ),
      ),
    );
  }
}

class MPadding extends EdgeInsetsDirectional {
  @override
  final double vertical, horizontal;

  const MPadding.set({
    start = 0,
    top = 0,
    end = 0,
    bottom = 0,
    all = 0,
    this.vertical = 0,
    this.horizontal = 0,
  }) : super.only(
          bottom: bottom + vertical + all,
          top: top + vertical + all,
          end: end + horizontal + all,
          start: start + horizontal + all,
        );
}
