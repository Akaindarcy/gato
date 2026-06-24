import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SmsService {
  static const platform = MethodChannel('gato.sms');

  Future<bool> isAvailable() async {
    try {
      return await platform.invokeMethod('isAvailable') ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<void> send(String phoneNumber, String message) async {
    await platform.invokeMethod('send', {
      'phoneNumber': phoneNumber,
      'message': message,
    });
  }

  Future<void> sendStructuredSale({
    required String phoneNumber,
    required double amount,
    required String category,
    String? note,
  }) async {
    final text = 'GATO SELL ${amount.toStringAsFixed(0)} $category${note != null ? " $note" : ""}';
    await send(phoneNumber, text);
  }
}
