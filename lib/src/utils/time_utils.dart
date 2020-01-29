import 'package:intl/intl.dart';

class TimeUtils {
  const TimeUtils._();

  static final DateFormat timeFormatter = DateFormat('dd/MM HH:mm');
  static final DateFormat todayTimeFormatter = DateFormat('HH:mm');

  static String formatTime(DateTime time) {
    if (time == null) {
      throw ArgumentError.notNull('time');
    }

    if (time.day == DateTime.now().day) {
      return todayTimeFormatter.format(time);
    } else {
      return timeFormatter.format(time);
    }
  }

  static DateTime fromUtc(DateTime time) {
    return DateTime.utc(
        time.year, time.month, time.day, time.hour, time.minute, time.second);
  }
}
