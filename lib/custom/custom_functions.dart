double progressDays(
  DateTime date1,
  DateTime date2,
) {
  DateTime now = DateTime.now();
  DateTime nowDay = DateTime(now.year, now.month, now.day);
  //int daysPassed = nowDay.difference(date1).inDays; // The difference between the beginning and the current day
  int daysLeft = date2
      .difference(nowDay)
      .inDays; // The difference between the curent and the end
  int allDays = date2.difference(date1).inDays;
  double inDouble = daysLeft / allDays;
  //double temp = 100 / allDays;
  double result = 1 - inDouble;

  return (result > 0) ? result : 0;
}

bool showSearchResult(
  String? textfield,
  String? searchingText,
) {
  return searchingText!.toLowerCase().contains(textfield!.toLowerCase());
}
