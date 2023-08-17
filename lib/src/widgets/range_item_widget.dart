import 'package:cupertino_range_slider_improved/cupertino_range_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mwidgets/src/consts/colors.dart';
import 'package:mwidgets/src/consts/states.dart';
import 'package:mwidgets/src/widgets/text.dart';

class MRangeItemWidget extends StatelessWidget {
  final double min, max;
  final MRangeItemWidgetCubit cubit;
  final Function(double value) onMinChanged, onMaxChanged;
  final Key? mKey;

  MRangeItemWidget({
    Key? key,
    required this.min,
    required this.max,
    required this.onMinChanged,
    required this.onMaxChanged,
    required this.cubit,
    this.mKey,
  }) : super(key: key) {
    cubit.init(min, max);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<MRangeItemWidgetCubit, ProcessState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MText(text: cubit.minValue.toInt().toString()),
                  MText(text: cubit.maxValue.toInt().toString()),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CupertinoRangeSlider(
                      key: mKey,
                      activeColor: Coolors.primaryColor,
                      thumbColor: Coolors.primaryColor,
                      minValue: cubit.minValue,
                      maxValue: cubit.maxValue,
                      min: min,
                      max: max,
                      onMinChanged: (value) {
                        onMinChanged(value);
                        cubit.onMinChanged(value);
                      },
                      onMaxChanged: (value) {
                        onMaxChanged(value);
                        cubit.onMaxChanged(value);
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

@injectable
class MRangeItemWidgetCubit extends Cubit<ProcessState> {
  double minValue = 0, maxValue = 0, min = 0, max = 0;

  MRangeItemWidgetCubit() : super(SuccessState());

  void onMaxChanged(value) {
    maxValue = value;
    emit(SuccessState(data: maxValue));
  }

  void init(min, max) {
    this.max = max;
    this.min = min;
    reset();
  }

  void onMinChanged(value) {
    minValue = value;
    emit(SuccessState(data: minValue));
  }

  void reset() {
    onMaxChanged(max);
    onMinChanged(min);
  }
}
