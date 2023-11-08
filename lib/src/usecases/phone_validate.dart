import 'dart:async';

import 'package:phone_number/phone_number.dart';

class PhoneValidator {
  final StreamController<bool> validate;

  PhoneValidator(this.validate);

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
