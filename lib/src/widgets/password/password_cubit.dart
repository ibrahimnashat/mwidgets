import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mwidgets/src/consts/states.dart';

@injectable
class PasswordCubit extends Cubit<ProcessState> {
  PasswordCubit() : super(EmptyState());
  bool hide = true;

  void showOrHide() {
    hide = !hide;
    if (hide) {
      emit(SuccessState());
    } else {
      emit(EmptyState());
    }
  }
}
