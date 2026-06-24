import 'package:flutter/services.dart';

class UssdService {
  static const platform = MethodChannel('gato.ussd');

  Future<String> invoke(String ussdCode) async {
    try {
      final result = await platform.invokeMethod('invoke', {'code': ussdCode});
      return result as String;
    } catch (e) {
      return 'Error: $e';
    }
  }

  Future<void> registerCallback(void Function(String) onResponse) async {
    await platform.setMethodCallHandler((call) async {
      if (call.method == 'ussdResponse') {
        onResponse(call.arguments as String);
      }
    });
  }
}
