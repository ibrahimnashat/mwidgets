import 'package:flutter/material.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/consts/font_families.dart';
import 'package:mwidgets/src/consts/svgs.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/widgets/image.dart';
import 'package:mwidgets/src/widgets/text.dart';

typedef RetreiveTitle<T> = String Function(T json);

// ignore: must_be_immutable
class MDropDown<T> extends StatefulWidget {
  final List<T> options;
  final T? setInitial;
  final String? hint;
  final String? title;
  double? height;
  final bool check;
  final ValueChanged<T?> onChanged;
  final bool isCenter;
  final bool removeBorder;
  final RetreiveTitle<T> itemTitle;
  final bool isExpanded;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? hintColor;
  final double textSize;
  final Color? dropdownColor;
  final bool inFill;
  final Widget Function(T? itemImage)? perfix;
  final double paddingHorizontal;
  final double paddingVertical;
  final double iconSize;
  final double borderRadius;
  final bool hideDropdown;

  MDropDown({
    Key? key,
    required this.onChanged,
    required this.itemTitle,
    this.inFill = true,
    this.perfix,
    this.title,
    this.height,
    this.options = const [],
    this.removeBorder = true,
    this.hint = "",
    this.isCenter = false,
    this.setInitial,
    this.check = false,
    this.isExpanded = true,
    this.iconColor,
    this.textColor,
    this.textSize = 20,
    this.dropdownColor,
    this.borderColor,
    this.hintColor,
    this.backgroundColor,
    this.paddingHorizontal = 21.0,
    this.paddingVertical = 6.0,
    this.iconSize = 12.0,
    this.borderRadius = 5.0,
    this.hideDropdown = false,
  }) : super(key: key);

  @override
  State<MDropDown<T>> createState() => _MDropDownState<T>();
}

class _MDropDownState<T> extends State<MDropDown<T>> {
  T? item;
  ValueNotifier<List<T>> items = ValueNotifier([]);

  @override
  void initState() {
    items.addListener(() {
      if (widget.setInitial != null) {
        item = widget.setInitial;
        widget.onChanged(item);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    items.value = widget.options;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          MText(
            text: widget.title,
            size: widget.textSize,
            weight: FontWeight.w500,
            fontFamily: FoontFamily.enFont,
            color: Coolors.primaryColor,
          ).addPadding(bottom: 12.0),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: widget.paddingVertical,
            horizontal: widget.paddingHorizontal,
          ),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: widget.inFill
                ? null
                : Border.all(color: widget.borderColor ?? Coolors.highLight),
          ),
          child: DropdownButton<T>(
            dropdownColor: widget.dropdownColor,
            elevation: 2,
            underline: widget.removeBorder
                ? const SizedBox()
                : Container(
                    height: 0.5,
                    color: Coolors.primaryColor,
                  ),
            isExpanded: widget.isExpanded,
            icon: widget.hideDropdown
                ? const SizedBox()
                : Column(
                    children: [
                      MSvg(
                        name: Svgs.dropdown,
                        color: widget.iconColor ?? Coolors.borderColor,
                        height: widget.iconSize,
                      )
                    ],
                  ).addPadding(start: widget.removeBorder ? 12.0 : 0.0),
            hint: Row(
              children: [
                if (widget.perfix != null) widget.perfix!(item),
                MText(
                  text: widget.hint,
                  color: widget.hintColor ?? Coolors.borderColor,
                  size: widget.textSize,
                  align: widget.isCenter ? TextAlign.center : TextAlign.start,
                ).addPadding(bottom: widget.removeBorder ? 0 : 21.0),
              ],
            ),
            value: item,
            onChanged: (value) {
              setState(() {
                item = value;
              });
              widget.onChanged(value);
            },
            items: widget.options.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Row(
                  children: [
                    if (widget.perfix != null) widget.perfix!(item),
                    MText(
                      color: widget.textColor ?? Coolors.black,
                      size: widget.textSize,
                      text: widget.itemTitle(item),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    items.removeListener(() {});
    items.dispose();
    super.dispose();
  }
}
