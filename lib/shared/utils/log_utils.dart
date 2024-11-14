import 'package:logger/logger.dart';

class Log {
  const Log._();

  static void d(final String message) {
    Logger().d(message);
  }

  static void e(final String message) {
    Logger().e(message);
  }

  static void i(final String message) {
    Logger().i(message);
  }

  static void w(final String message) {
    Logger().w(message);
  }

}
