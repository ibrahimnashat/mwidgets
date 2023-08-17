import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mwidgets/src/consts/states.dart';

@injectable
class DropdownCubit extends Cubit<ProcessState> {
  DropdownCubit() : super(InitialState());

  void setInitialValue<T>(T? item) {
    emit(InitialState<T?>(data: item));
  }

  void onSelectItem<T>(T item) {
    emit(SuccessState<T>(data: item));
  }
}
