import 'package:eitherx/eitherx.dart';
import 'package:mwidgets/src/consts/failure.dart';

extension OnEither<T> on Either<Failure, T> {
  dynamic right(Function(T data) callBack) {
    return fold(
      (failure) {},
      (data) {
        callBack(data);
        return data;
      },
    );
  }

  dynamic left(Function(Failure failure) callBack) {
    return fold(
      (failure) {
        callBack(failure);
        return failure;
      },
      (data) {},
    );
  }
}
