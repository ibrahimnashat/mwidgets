import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_zoom_on_move/image_zoom_on_move.dart';
import 'package:mwidgets/src/extensions/context.dart';

void showImageDialog(
  BuildContext context,
  String item, {
  double width = 500,
  double height = 500,
  MouseCursor? cursor = SystemMouseCursors.zoomIn,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: context.height * 0.4,
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: Stack(
                children: [
                  if (item.contains('http'))
                    ImageZoomOnMove(
                      cursor: cursor,
                      width: width,
                      height: height,
                      onTap: () {},
                      image: Image.network(
                        item,
                        fit: BoxFit.cover,
                      ),
                    )
                  else if (item.contains('asset'))
                    ImageZoomOnMove(
                      onTap: () {},
                      cursor: cursor,
                      width: width,
                      height: height,
                      image: Image.asset(
                        item,
                        fit: BoxFit.cover,
                      ),
                    )
                  else
                    ImageZoomOnMove(
                      width: width,
                      height: height,
                      cursor: cursor,
                      onTap: () {},
                      image: Image.file(
                        File(item),
                        fit: BoxFit.cover,
                      ),
                    ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
