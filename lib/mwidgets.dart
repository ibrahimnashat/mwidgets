library mwidgets;

import 'package:flutter/material.dart';
import 'package:mwidgets/src/consts/font_families.dart';

import 'src/consts/colors.dart';

export 'src/consts/date_time.dart';
export 'src/consts/failure.dart';
export 'src/consts/fold.dart';
export 'src/consts/font_sizes.dart';
export 'src/consts/kprint.dart';
export 'src/consts/strings.dart';
export 'src/consts/validation.dart';
export 'src/extensions/context.dart';
export 'src/extensions/padding.dart';
export 'src/extensions/radius.dart';
export 'src/extensions/widget.dart';
export 'src/widgets/alert_dialog.dart';
export 'src/widgets/bottom_sheet.dart';
export 'src/widgets/buttons/buttons.dart';
export 'src/widgets/divider_widget.dart';
export 'src/widgets/dropdown/drop_down.dart';
export 'src/widgets/flash_toast.dart';
export 'src/widgets/image.dart';
export 'src/widgets/loader.dart';
export 'src/widgets/password/password.dart';
export 'src/widgets/pin_put_widget.dart';
export 'src/widgets/radio_item_widget.dart';
export 'src/widgets/range_item_widget.dart';
export 'src/widgets/rating.dart';
export 'src/widgets/scrolling.dart';
export 'src/widgets/text.dart';
export 'src/widgets/text_filed.dart';
export 'src/widgets/viewer/images_viewer_screen.dart';

class MWidgetsSetUp {
  void settings({
    required String fontEn,
    required String fontAr,
    Color? primary,
    Color? secondPrimary,
  }) {
    Coolors.setUp(primary: primary, secondPrimary: secondPrimary);
    FoontFamily.setUp(en: fontEn, ar: fontAr);
  }
}
