import 'package:intl/intl.dart';

import '../Model/News.dart';

class DateFormating{
  News news;
  DateFormating(this.news);
  formatingPublishedAt(DateTime publishedAt) {
    var dateTimeNow = DateTime.now();
    var difference = dateTimeNow.difference(publishedAt).inMinutes;

    if (difference < 0) {
      difference = dateTimeNow.difference(publishedAt).inSeconds;
      return '$difference seconds ago';
    } else if (difference > 0 && difference < 60) {
      difference = dateTimeNow.difference(publishedAt).inMinutes;
      return '$difference minutes ago';
    } else if (difference > 60 && difference < 1440) {
      difference = dateTimeNow.difference(publishedAt).inHours;
      return '$difference hours ago';
    } else if (difference > 1440 && difference < 44640) {
      difference = dateTimeNow.difference(publishedAt).inDays;
      return '$difference days ago';
    }
    return DateFormat.yMMMd().format(DateTime.parse(news.publishedAt ?? ""));
  }
}