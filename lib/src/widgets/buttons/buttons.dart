// ignore_for_file: must_be_immutable

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mwidgets/injection/injectable.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/consts/font_sizes.dart';
import 'package:mwidgets/src/consts/states.dart';
import 'package:mwidgets/src/extensions/context.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/extensions/widget.dart';
import 'package:mwidgets/src/widgets/image.dart';
import 'package:mwidgets/src/widgets/text.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';

import 'buttons_cubit.dart';

class MBouncingButton extends StatelessWidget {
  final String? title;
  Color? textColor;
  double? textSize;
  double iconSize;
  Function? onTap;
  double? width;
  final double? height;
  final String? icon;
  dynamic color;
  final double borderRadius;
  final bool iconTransparent;
  final Gradient? gradient;
  final TextDirection? textDirection;
  final bool willAnimated;
  final Key? mKey;

  MBouncingButton({
    Key? key,
    this.mKey,
    this.textColor,
    this.textSize,
    this.textDirection,
    this.iconSize = 20.0,
    this.title = "",
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.borderRadius = 14.0,
    this.iconTransparent = false,
    this.icon,
    this.gradient,
    this.willAnimated = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    width ??= 430;
    textColor ??= Coolors.white;
    textSize ??= FoontSize.font17;
    if (gradient == null) color ??= Coolors.primaryColor;
    return BouncingWidget(
      key: mKey,
      duration: const Duration(milliseconds: 100),
      scaleFactor: 1.5,
      onPressed: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height ?? 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: gradient,
        ),
        child: !willAnimated
            ? Row(
                textDirection: textDirection,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    MSvg(
                      name: icon,
                      color: iconTransparent ? null : textColor,
                      height: iconSize,
                      width: iconSize,
                    ),
                  if (title != null)
                    MText(
                      text: title,
                      align: TextAlign.center,
                      color: textColor!,
                      size: textSize!,
                      weight: FontWeight.w400,
                    ).addPadding(start: 12.0),
                ],
              )
            : null,
      ),
    );
  }
}

class MIconButton extends StatelessWidget {
  final String icon;
  Color iconColor;
  Function? onTap;
  final double? width;
  final double? height;
  final Decoration? decoration;
  final double padding;
  final bool stayOnBottom;

  MIconButton({
    Key? key,
    this.iconColor = Colors.black,
    this.icon = "",
    this.onTap,
    this.decoration,
    this.stayOnBottom = false,
    this.height,
    this.width,
    this.padding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      stayOnBottom: stayOnBottom,
      duration: const Duration(milliseconds: 100),
      scaleFactor: 1.5,
      onPressed: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        height: height,
        width: width,
        decoration: decoration,
        alignment: Alignment.center,
        padding: EdgeInsets.all(padding),
        child: MSvg(
          name: icon,
          height: 25,
          width: 25,
          color: iconColor,
        ),
      ),
    );
  }
}

class MBackButton extends StatelessWidget {
  final Function? onBack;

  const MBackButton({
    super.key,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Container(
        width: 55,
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xff92278F).withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          CupertinoIcons.back,
          color: Coolors.primaryColor,
        ),
      ).addAction(onGesture: () {
        if (onBack == null) {
          context.pop();
        } else {
          onBack!();
        }
      }),
    );
  }
}

class MSvgButton extends StatelessWidget {
  final Function? onTap;
  final String icon;
  final double width, height, borderRadius, iconSize;
  final Color backgroundColor;
  final Color? color;
  final Key? mKey;

  const MSvgButton({
    super.key,
    this.onTap,
    this.mKey,
    required this.icon,
    this.width = 45.0,
    this.height = 45.0,
    this.iconSize = 20.0,
    this.backgroundColor = Coolors.highLight,
    this.color,
    this.borderRadius = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: MSvg(
        name: icon,
        height: iconSize,
        width: iconSize,
        color: color,
      ),
    ).addAction(
      mKey: mKey,
      onGesture: onTap,
    );
  }
}

class MProgressButton extends StatelessWidget {
  final String? title;
  final Function onTap;
  final double progress;
  final Key? mKey;

  const MProgressButton({
    super.key,
    required this.onTap,
    this.progress = 0.36,
    this.title,
    this.mKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: mKey,
      children: [
        SquarePercentIndicator(
          startAngle: StartAngle.topLeft,
          width: 65.0,
          height: 65.0,
          borderRadius: 8.0,
          shadowWidth: 1.5,
          progressWidth: 1.2,
          shadowColor: Colors.transparent,
          progressColor: Coolors.primaryColor,
          progress: progress,
          child: Container(
            margin: const EdgeInsets.all(5.0),
            width: 55.0,
            height: 55.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Coolors.primaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Icon(
              CupertinoIcons.forward,
              color: Coolors.white,
              size: 28.0,
            ),
          ).addAction(onGesture: onTap),
        ).addPadding(bottom: 8.0),
        if (title != null)
          MText(
            text: title,
            color: Coolors.primaryColor,
            size: FoontSize.font15,
          ).addPadding(bottom: 50.0),
      ],
    );
  }
}

class MAnimatedButton extends StatefulWidget {
  final Widget success;
  final String title;
  final Key? mKey;
  final Future<void> Function() onTap;

  const MAnimatedButton({
    Key? key,
    required this.success,
    required this.title,
    required this.onTap,
    this.mKey,
  }) : super(key: key);

  @override
  State<MAnimatedButton> createState() => _MAnimatedButtonState();
}

class _MAnimatedButtonState extends State<MAnimatedButton>
    with TickerProviderStateMixin {
  late final cubit = getIt<ButtonsCubit>()..init(this, width: 200.0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<ButtonsCubit, ProcessState>(
        builder: (context, state) {
          final width = cubit.tweenButton!.value;
          return SizedBox(
            height: 60.0,
            child: Row(
              children: [
                if (width <= 70.0) widget.success,
                if (width > 35.0)
                  MBouncingButton(
                    mKey: widget.mKey,
                    willAnimated: width < 110,
                    title: widget.title,
                    onTap: () async {
                      await widget.onTap();
                      cubit.done();
                    },
                    width: width,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
