import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mwidgets/src/consts/font_sizes.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/widgets/text.dart';

import '../consts/colors.dart';

class MRatingItem extends StatelessWidget {
  final double rating;
  final double size;
  final bool ignoreGestures;
  final bool oneStar;
  final Function(double value) onRatingUpdate;
  final EdgeInsetsGeometry? padding, starPadding;
  final TextStyle? textStyle;
  final Color? color;
  final IconData filledIcon, emptyIcon, halfIcon;
  const MRatingItem({
    super.key,
    this.rating = 4.5,
    this.textStyle,
    this.padding,
    this.size = 18.0,
    this.ignoreGestures = true,
    this.oneStar = true,
    required this.onRatingUpdate,
    this.color,
    this.starPadding,
    this.filledIcon = CupertinoIcons.star_fill,
    this.emptyIcon = CupertinoIcons.star_fill,
    this.halfIcon = CupertinoIcons.star_lefthalf_fill,
  });

  @override
  Widget build(BuildContext context) {
    if (oneStar) {
      return Row(
        children: [
          Icon(
            filledIcon,
            color: color ?? Coolors.orange,
            size: size,
          ).addPadding(end: 3.0),
          Padding(
            padding: padding ?? const MPadding.set(top: 6.0),
            child: MText(
              text: '$rating',
              size: FoontSize.font12,
              color: color ?? Coolors.orange,
              weight: FontWeight.w500,
              style: textStyle,
            ),
          )
        ],
      );
    }
    return RatingBar(
      textDirection: TextDirection.ltr,
      itemCount: 5,
      ignoreGestures: ignoreGestures,
      initialRating: rating,
      itemSize: size,
      allowHalfRating: true,
      itemPadding: starPadding ?? const EdgeInsetsDirectional.only(start: 2.0),
      ratingWidget: RatingWidget(
        full: Icon(
          filledIcon,
          color: color ?? Coolors.orange,
          size: size,
        ),
        half: Icon(
          halfIcon,
          color: color ?? Coolors.orange,
          size: size,
        ),
        empty: Icon(
          emptyIcon,
          color: Coolors.grey,
          size: size,
        ),
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
