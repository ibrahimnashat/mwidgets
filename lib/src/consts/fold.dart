import 'package:eitherx/eitherx.dart';
import 'package:mwidgets/src/consts/failure.dart';
import 'package:mwidgets/src/consts/kprint.dart';

extension OnEither<T> on Either<Failure, T> {
  dynamic right(Function(T data) callBack) {
    return fold(
      (failure) {
        kPrint('Error! $failure');
      },
      (data) {
        callBack(data);
        return data;
      },
    );
  }

  dynamic left(Function(Failure failure) callBack) {
    return fold(
      (failure) {
        kPrint(failure.code);
        kPrint(failure.message);
        callBack(failure);
        return failure;
      },
      (data) {},
    );
  }
}
