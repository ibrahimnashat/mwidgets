import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:phone_number/phone_number.dart';

@injectable
class PhoneValidator {
  final StreamController<bool> validate = StreamController<bool>.broadcast();

  String countryCode = 'EG';

  void serCountryCode(value) {
    countryCode = value;
  }

  Future<PhoneNumber?> getPhone({required String phone}) async {
    try {
      PhoneNumber phoneNumber = await PhoneNumberUtil().parse(
        phone,
        regionCode: countryCode,
      );
      if (phoneNumber.e164 == '' ||
          phoneNumber.type != PhoneNumberType.MOBILE) {
        validate.sink.add(false);
        return null;
      }
      validate.sink.add(true);
      return phoneNumber;
    } catch (e) {
      validate.sink.add(false);
      return null;
    }
  }

  Future<void> close() async {
    await validate.close();
  }
}
