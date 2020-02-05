import 'package:intl/intl.dart';

class TimeUtils {
  const TimeUtils._();

  static const String _defaultTimeFormat = 'HH:mm';
  static const String _defaultDateFormat = 'dd/MM';
  static const String _defaultSeparator = ' ';

  static String formatTime(
    DateTime time, {
    String timeFormat = _defaultTimeFormat,
    String dateFormat = _defaultDateFormat,
    String separator = _defaultSeparator,
    bool forceShowDate = false,
    String locale,
  }) {
    assert(time != null);

    DateFormat formatter;

    if (time.day == DateTime.now().day && !forceShowDate) {
      formatter = DateFormat(timeFormat);
    } else {
      formatter = DateFormat('$dateFormat$separator$timeFormat');
    }

    return formatter.format(time);
  }

  static DateTime fromUtc(DateTime time) {
    return DateTime.utc(
        time.year, time.month, time.day, time.hour, time.minute, time.second);
  }
}
