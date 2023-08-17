import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

void kPrint(dynamic data) {
  if (kDebugMode) {
    if (data is String) {
      _pr(data);
    } else if (data is Map) {
      _pr(jsonEncode(data));
    } else {
      _pr(data.toString());
    }
  }
}

void _pr(String data) {
  if (data.length > 500) {
    log(data);
  } else {
    print(data);
  }
  log(StackTrace.current.toString().split('\n')[2]);
}
