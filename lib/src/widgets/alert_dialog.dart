import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mwidgets/src/consts/font_sizes.dart';
import 'package:mwidgets/src/consts/svgs.dart';
import 'package:mwidgets/src/extensions/context.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/extensions/widget.dart';
import 'package:mwidgets/src/widgets/image.dart';
import 'package:mwidgets/src/widgets/text.dart';

showMCupertinoDialog({
  Color titleColor = Colors.black,
  required BuildContext context,
  required Widget child,
  String? title,
  Widget? topTitle,
  bool showExit = false,
  Function? onTap,
  BorderRadiusGeometry? borderRadius,
  EdgeInsetsGeometry? margin,
  Gradient? gradient,
  Color? backgroundColor = Colors.white,
}) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return Material(
        type: MaterialType.transparency,
        child: Container(
          color: Colors.white12,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: margin ?? const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: gradient == null ? backgroundColor : null,
                      gradient: gradient,
                      borderRadius: borderRadius ?? BorderRadius.circular(50.0),
                    ),
                    child: Column(
                      children: [
                        if (topTitle != null) topTitle,
                        Stack(
                          children: [
                            Align(
                              child: Column(
                                children: [
                                  if (title != null)
                                    MText(
                                      text: title,
                                      size: FoontSize.font22,
                                      weight: FontWeight.w800,
                                      color: titleColor,
                                    ).addPadding(
                                      bottom: 30.0,
                                      top: topTitle != null ? 0 : 21.0,
                                    ),
                                  child
                                ],
                              ).addPadding(top: 12.0),
                            ),
                            if (showExit)
                              const Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: MSvg(
                                  name: Svgs.exit,
                                  height: 35.0,
                                  width: 35.0,
                                ),
                              ).addAction(
                                padding: MPadding.set(
                                  all: topTitle != null ? 0 : 24.0,
                                  horizontal: topTitle != null ? 24.0 : 0,
                                ),
                                onGesture: () {
                                  context.pop();
                                },
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ).addAction(onGesture: onTap ?? () => context.pop()),
          ),
        ),
      );
    },
  );
}
