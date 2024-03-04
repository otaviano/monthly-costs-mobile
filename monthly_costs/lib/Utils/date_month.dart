import 'package:intl/intl.dart';

int getMonthNow()
{
  DateTime date = DateTime.now();

  return date.month;
}

DateTime getDateByMonth(String month)
{
  DateTime date = DateTime.now();

  return DateTime(date.year, int.parse(month), 01);
}

String getDateOnlyByMonth(String month) {
 var date = getDateByMonth(month);

  return DateFormat('yyyy-MM-dd').format(date);
}