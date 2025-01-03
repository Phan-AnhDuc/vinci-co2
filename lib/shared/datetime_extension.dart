// import 'package:easy_localization/easy_localization.dart';
// import 'package:one_link/src/shared/constant.dart';

// /// Convert timestampt thành thời gian
// String convertTimestampToTime(int timestamp) {
//   final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
//   final String dayOfWeek = daysOfWeek[dateTime.weekday % 7];
//   final String time = '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} $dayOfWeek';
//   return time;
// }

// /// Lấy ngày hiện tại
// String getCurrentDate({required DateFormat dateFormat}) {
//   final DateTime now = DateTime.now();
//   final String formattedDate = dateFormat.format(now);
//   return formattedDate;
// }

// /// Lấy ngày và thời gian cách hiện tại theo số giờ truyền vào
// String getHoursAgo({required int hoursAgo, required DateFormat dateFormat}) {
//   final DateTime now = DateTime.now();
//   final DateTime dateTime = now.subtract(Duration(hours: hoursAgo));
//   final String formattedDate = dateFormat.format(dateTime);
//   return formattedDate;
// }

// /// Lấy ngày và thời gian cách hiện tại theo số ngày truyền vào
// String getDaysAgo({required int daysAgo, required DateFormat dateFormat}) {
//   final DateTime now = DateTime.now();
//   final DateTime dateTime = now.subtract(Duration(days: daysAgo));
//   final String formattedDate = dateFormat.format(dateTime);
//   return formattedDate;
// }

// /// Convert timeStamp to String
// String convertDate({required int time, required DateFormat dateFormat}) {
//   final String formattedDate = dateFormat.format(DateTime.fromMillisecondsSinceEpoch(time));
//   return formattedDate;
// }
