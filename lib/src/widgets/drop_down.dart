import 'package:flutter/material.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/consts/svgs.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/widgets/image.dart';
import 'package:mwidgets/src/widgets/text.dart';

typedef RetreiveTitle<T> = String Function(T item);

// ignore: must_be_immutable
class MDropDown<T> extends StatefulWidget {
  final List<T> options;
  final T? setInitial;
  final String? hint;
  final String? title;
  final EdgeInsetsGeometry? dropdownPadding, titlePadding;
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
  final Color? titleColor;
  final Color? hintColor;
  final double textSize, titleSize;
  final Color? dropdownColor;
  final bool inFill;
  final Widget Function(T? itemImage)? prefix;

  final double iconSize;
  final double borderRadius;
  final bool hideDropdown;
  final FontWeight? titleWeight, textWeight;

  MDropDown({
    Key? key,
    required this.onChanged,
    required this.itemTitle,
    this.inFill = true,
    this.prefix,
    this.dropdownPadding = const MPadding.set(horizontal: 21.0, vertical: 6.0),
    this.titlePadding = const MPadding.set(vertical: 12.0),
    this.title,
    this.titleColor,
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
    this.titleSize = 20,
    this.dropdownColor,
    this.borderColor,
    this.hintColor,
    this.titleWeight,
    this.textWeight,
    this.backgroundColor,
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
          Padding(
            padding: widget.titlePadding ?? EdgeInsets.zero,
            child: MText(
              text: widget.title,
              size: widget.titleSize,
              weight: widget.titleWeight,
              color: widget.titleColor ?? Coolors.primaryColor,
            ),
          ),
        Container(
          height: widget.height,
          padding: widget.dropdownPadding,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: widget.inFill
                ? null
                : Border.all(color: widget.borderColor ?? Coolors.highlight),
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
                if (widget.prefix != null) widget.prefix!(item),
                MText(
                  text: widget.hint,
                  color: widget.hintColor ?? Coolors.borderColor,
                  size: widget.textSize,
                  weight: widget.titleWeight,
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
                    if (widget.prefix != null) widget.prefix!(item),
                    MText(
                      color: widget.textColor ?? Coolors.black,
                      size: widget.textSize,
                      text: widget.itemTitle(item),
                      weight: widget.textWeight,
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
