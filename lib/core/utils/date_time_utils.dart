import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

//const String dateTimeFormatPattern = 'yyyy-MM-dd HH:mm:ss';
const String dateFormatPattern = 'yyyy/MM/dd'; // Updated pattern

extension DateTimeExtension on DateTime {
  String format({
    String pattern = dateFormatPattern,
    String? locale,
  }) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  String customFormat({
    String pattern = dateFormatPattern,
    String? locale,
  }) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final dateOnly = DateTime(year, month, day);
    if (dateOnly.isAtSameMomentAs(now)) {
      return 'Now';
    } else if (dateOnly.isAtSameMomentAs(today)) {
      return 'Today';
    } else if (dateOnly.isAtSameMomentAs(yesterday)) {
      return 'Yesterday';
    } else {
      return format(pattern: pattern, locale: locale);
    }
  }
}
