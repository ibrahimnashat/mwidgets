import 'dart:async';

import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class PhoneValidator {
  final StreamController<bool> validate;

  PhoneValidator(this.validate);

  IsoCode countryCode = IsoCode.EG;

  void setCountryCode(String value) {
    final index = IsoCode.values.indexWhere((e) => e.name == value);
    if (index != -1) {
      countryCode = IsoCode.values[index];
    }
  }

  Future<PhoneNumber?> getPhone({required String phone}) async {
    try {
      PhoneNumber phoneNumber = PhoneNumber.parse(
        phone,
        callerCountry: countryCode,
      );
      if (!phoneNumber.isValid(type: PhoneNumberType.mobile)) {
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
