import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mwidgets/injection/injectable.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/consts/states.dart';
import 'package:mwidgets/src/extensions/padding.dart';
import 'package:mwidgets/src/extensions/widget.dart';
import 'package:mwidgets/src/widgets/image.dart';

import '../../consts/svgs.dart';
import 'password_cubit.dart';

class MPasswordWidget extends StatefulWidget {
  final Widget Function(Widget icon, bool hide) child;

  const MPasswordWidget({
    super.key,
    required this.child,
  });

  @override
  State<MPasswordWidget> createState() => _MPasswordWidgetState();
}

class _MPasswordWidgetState extends State<MPasswordWidget> {
  late final PasswordCubit cubit;

  @override
  void initState() {
    cubit = getIt<PasswordCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordCubit, ProcessState>(
      bloc: cubit,
      builder: (context, state) {
        final hide = state is EmptyState;
        final icon = MSvg(
          name: hide ? Svgs.hide : Svgs.show,
          color: Coolors.grey,
        ).addPadding(all: 20.0).addAction(onGesture: () => cubit.showOrHide());
        return widget.child(icon, hide);
      },
    );
  }
}
