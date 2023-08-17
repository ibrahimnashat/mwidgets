import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class Validate {
  String emailPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  String passwordPattern =
      '(?=[A-Za-z0-9@#\$%^&+!=]+\$)^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#\$%^&+!=])(?=.{8,}).*\$';
  String englishPattern = r'/^[a-zA-Z]+$/';
  bool emailValid(String email) {
    return RegExp(emailPattern).hasMatch(email);
  }

  bool passwordValid(String email) {
    return RegExp(emailPattern).hasMatch(email);
  }

  bool sameControllerData(
      TextEditingController first, TextEditingController second) {
    return first.text == second.text && first.text.isNotEmpty;
  }

  bool sameData(String? first, String? second) {
    final firstNull = first != null && first != '';
    final secondNull = second != null && second != '';
    return first == second && secondNull && firstNull;
  }

  bool notSameData(dynamic first, dynamic second) {
    final firstNull = first != null && first != '';
    final secondNull = second != null && second != '';
    return first != second && secondNull && firstNull;
  }

  bool dataNotEmpty(List<TextEditingController> controllers) {
    final res = controllers.map((item) => item.text.isEmpty).toList();
    return !res.contains(true);
  }

  bool containsEnglish(value) {
    if (value == null) return true;
    return value.contains(RegExp(r'[a-z]'));
  }
}

class Validates {
  static String emailPattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

  static String? isEmail({
    required String email,
    required String errorMessage,
  }) {
    if (!RegExp(emailPattern).hasMatch(email)) {
      return errorMessage;
    }
    return null;
  }

  static String? isPassword({
    required String password,
    required String errorMessage,
  }) {
    if (password.length < 8) {
      return errorMessage;
    }
    return null;
  }

  static String? isConfirmPassword({
    required String password,
    required String confrimPassword,
    required String errorMessage,
  }) {
    if (password != confrimPassword) {
      return errorMessage;
    }
    return null;
  }

  static String? isHasData({
    required String data,
    required String errorMessage,
    int minLength = 3,
  }) {
    if (data.isEmpty || data.length < minLength) {
      return errorMessage;
    }
    return null;
  }
}
