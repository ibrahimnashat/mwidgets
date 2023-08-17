import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mwidgets/injection/injectable.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/consts/font_families.dart';
import 'package:mwidgets/src/consts/states.dart';
import 'package:mwidgets/src/consts/svgs.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/widgets/image.dart';
import 'package:mwidgets/src/widgets/text.dart';

import 'dropdown_cubit.dart';

typedef RetreiveTitle<T> = String Function(T json);

// ignore: must_be_immutable
class MDropDown<T> extends StatelessWidget {
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
    this.paddingHorizontal = 21.0,
    this.paddingVertical = 6.0,
    this.iconSize = 12.0,
    this.borderRadius = 5.0,
    this.hideDropdown = false,
  }) : super(key: key);

  late final DropdownCubit cubit = getIt<DropdownCubit>()
    ..setInitialValue<T?>(setInitial);

  T? item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          MText(
            text: title,
            size: textSize,
            weight: FontWeight.w500,
            fontFamily: FoontFamily.enFont,
            color: Coolors.primaryColor,
          ).addPadding(bottom: 12.0),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: paddingVertical,
            horizontal: paddingHorizontal,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(borderRadius),
            border: inFill
                ? null
                : Border.all(color: borderColor ?? Coolors.highLight),
          ),
          child: BlocBuilder<DropdownCubit, ProcessState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is InitialState) {
                item = state.data;
              } else if (state is SuccessState) {
                item = state.data;
              }
              return DropdownButton<T>(
                dropdownColor: dropdownColor,
                elevation: 2,
                underline: removeBorder
                    ? const SizedBox()
                    : Container(
                        height: 0.5,
                        color: Coolors.primaryColor,
                      ),
                isExpanded: isExpanded,
                icon: hideDropdown
                    ? const SizedBox()
                    : Column(
                        children: [
                          MSvg(
                            name: Svgs.dropdown,
                            color: iconColor ?? Coolors.borderColor,
                            height: iconSize,
                          )
                        ],
                      ).addPadding(start: removeBorder ? 12.0 : 0.0),
                hint: MText(
                  fontFamily: FoontFamily.enFont,
                  text: hint,
                  color: hintColor ?? Coolors.borderColor,
                  size: textSize,
                  align: isCenter ? TextAlign.center : TextAlign.start,
                ).addPadding(bottom: removeBorder ? 0 : 21.0),
                value: item,
                onChanged: (value) {
                  onChanged(value);
                  cubit.onSelectItem<T?>(value);
                },
                items: options.map((T item) {
                  return DropdownMenuItem<T>(
                    value: item,
                    child: Row(
                      children: [
                        if (perfix != null) perfix!(item),
                        MText(
                          color: textColor ?? Coolors.black,
                          size: textSize,
                          text: itemTitle(item),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
