import 'package:sentry_flutter/sentry_flutter.dart';

class RuleEngine {
  static Future<bool> shouldCapture(SentryEvent event) async {
    return true;
  }
}
