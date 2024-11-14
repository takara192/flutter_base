import 'package:intl/intl.dart';

import '../constants/date_time_constants.dart';


class DateTimeUtils {

  String? convertToddMMyyyy(DateTime? dateTime) {
    if(dateTime == null) return null;
    var inputFormat = DateFormat('dd/MM/yyyy');

    return inputFormat.format(dateTime);
  }

  String? convertToyyyyMM(DateTime? dateTime) {
    if(dateTime == null) return null;
    var inputFormat = DateFormat('yyyy-MM');

    return inputFormat.format(dateTime);
  }

  String formatTimeClock(DateTime dateTime) {
    return DateFormat(DateTimeConstants.CLOCK_TIMEFORMAT).format(dateTime);
  }

  String formatDateTimeWorkTimeExport(DateTime dateTime) {
    return DateFormat(DateTimeConstants.WORKTIMEEXPORT_DATETIMEFORMAT)
        .format(dateTime);
  }

  String formatDateTimeWorkTime(DateTime dateTime) {
    return DateFormat(DateTimeConstants.DATETIMEFORMAT_VN).format(dateTime);
  }

  String formatDateTimeWorkTimeInHour(DateTime dateTime) {
    return DateFormat(DateTimeConstants.WORKTIME_FORMAT).format(dateTime);
  }
  // Timestamp? convertToTimeStamp(DateTime? dateTime) {
  //   if(dateTime == null) return null;
  //   DateTime currentPhoneDate = dateTime; //DateTime
  //
  //   Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate);
  //
  //   return myTimeStamp;
  // }
}
