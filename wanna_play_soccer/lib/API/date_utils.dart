class MyDateUtils {
  static DateTime dateTimeFromString(String date) => DateTime.parse(date);
  static String dateTimeToString(DateTime date) => date.toIso8601String();
}
