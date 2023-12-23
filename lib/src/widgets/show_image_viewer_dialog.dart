import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mwidgets/src/extensions/context.dart';
import 'package:photo_view/photo_view.dart';

void showImageDialog(BuildContext context, String item) {
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
                    PhotoView(imageProvider: NetworkImage(item))
                  else
                    if (item.contains('asset'))
                      PhotoView(imageProvider: AssetImage(item))
                    else
                      PhotoView(imageProvider: FileImage(File(item))),
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
