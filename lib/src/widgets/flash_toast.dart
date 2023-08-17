import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/consts/font_sizes.dart';
import 'package:mwidgets/src/extensions/context.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/widgets/text.dart';

class FToast {
  static void showError({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    _showCustomToast(
      context: context,
      title: title,
      content: message,
      boxColor: Coolors.red,
    );
  }

  static void showSuccess({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    _showCustomToast(
      context: context,
      title: title,
      content: message,
      boxColor: Coolors.primaryColor,
    );
  }

  static Future<Object?> _showCustomToast({
    required BuildContext context,
    required String title,
    required String content,
    required Color boxColor,
  }) {
    return showFlash(
      barrierDismissible: true,
      context: context,
      persistent: true,
      transitionDuration: const Duration(milliseconds: 400),
      duration: const Duration(seconds: 4),
      builder: (context, controller) {
        return Flash(
          position: FlashPosition.bottom,
          dismissDirections: const [FlashDismissDirection.vertical],
          controller: controller,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                type: MaterialType.transparency,
                child: Container(
                  padding: const EdgeInsets.only(top: 12.0),
                  margin: const EdgeInsets.only(
                    bottom: 20.0,
                    left: 4.0,
                    right: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(24.0),
                    boxShadow: [
                      BoxShadow(
                        color: boxColor,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: context.width * 0.82,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Coolors.highLight,
                              spreadRadius: 1,
                              blurRadius: 1,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MText(
                                  text: title,
                                  size: FoontSize.font20,
                                  color: boxColor,
                                  weight: FontWeight.w800,
                                ).addPadding(bottom: 16.0, horizontal: 21.0),
                                InkWell(
                                  onTap: () {
                                    controller.dismiss();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.grey.shade300,
                                      size: 22.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.grey.shade100,
                              thickness: 1.0,
                            ),
                            MText(
                              text: content,
                              maxLines: 2,
                              size: FoontSize.font16,
                            ).addPadding(top: 12.0, horizontal: 21.0),
                          ],
                        ).addPadding(bottom: 21.0, top: 12.0),
                      ),
                    ],
                  ),
                ),
              ).addPadding(bottom: context.height * 0.07),
            ],
          ),
        );
      },
    );
  }
}
