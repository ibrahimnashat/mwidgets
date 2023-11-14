import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/extensions/context.dart';
import 'package:mwidgets/src/extensions/widget.dart';
import 'package:mwidgets/src/widgets/scrolling.dart';

void showMBottomSheet({
  required BuildContext context,
  required Widget bottomSheet,
  String? title,
  bool noScrolling = false,
}) {
  showModalBottomSheet(
    enableDrag: true,
    elevation: 0.0,
    constraints: BoxConstraints(
      maxHeight: context.height * 0.8,
      minWidth: context.width,
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        constraints: BoxConstraints(
          maxHeight: context.height * 0.85,
          minWidth: context.width,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: SafeArea(
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: context.height * 0.78,
                      minWidth: context.width,
                    ),
                    margin: const EdgeInsets.all(2.0),
                    padding: const EdgeInsetsDirectional.only(
                      top: 30.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Coolors.highlight,
                          blurRadius: 2.0,
                        )
                      ],
                    ),
                    child: noScrolling
                        ? bottomSheet
                        : MScroll(
                            child: bottomSheet,
                          ),
                  ),
                )
              ],
            ).addAction(onGesture: () => context.pop()),
          ),
        ),
      );
    },
  );
}
