import 'package:intl/intl.dart';

class DateTimeUtility {
  static List<String> daysOfWeekShort = DateFormat.EEEE('en_US').dateSymbols.SHORTWEEKDAYS;

  static String format(
    DateTime dateTime, {
    String pattern = 'MM/dd/yyyy HH:mm:ss',
  }) {
    return DateFormat(pattern).format(dateTime);
  }

  static DateTime durationToDateTime(Duration duration) {
    DateTime crntTime = DateTime.now();
    return DateTime(
      crntTime.year,
      crntTime.month,
      crntTime.day,
      duration.inHours.remainder(24),
      duration.inMinutes.remainder(60),
      duration.inSeconds.remainder(60),
    );
  }
}
