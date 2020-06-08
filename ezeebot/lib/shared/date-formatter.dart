import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime date, String format) {
    return new DateFormat(format).format(date).toString();
  }
}