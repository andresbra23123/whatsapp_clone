import 'dart:developer';

import 'package:flutter/foundation.dart';

void customLog(
  String message, {
  StackTrace? stackTrace,
}) {
  if (kDebugMode) {
    log(message, stackTrace: stackTrace);
  }
}
