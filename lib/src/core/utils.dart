import 'dart:developer' as developer;

import 'package:dio/dio.dart';

void logger(Object message) {
  developer.log(message.toString());
}

int getTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

Exception exception(Response response) {
  logger(response.statusCode.toString());
  return Exception(response.data['detail']);
}
