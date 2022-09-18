class DateHelper {
  static bool isToday(DateTime a) {
    DateTime now = DateTime.now();
    return DateTime(a.year, a.month, a.day) ==
        DateTime(now.year, now.month, now.day);
  }

  static bool isSameDay(DateTime a, DateTime b) =>
      DateTime(a.year, a.month, a.day) == DateTime(b.year, b.month, b.day);
}
