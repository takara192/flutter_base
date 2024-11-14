class DateTimeConstants {
  const DateTimeConstants._();

  static const String WORKTIME_FORMAT = 'HH:mm';
  static const String CLOCK_TIMEFORMAT = 'HH:mm:ss';
  static const String CLOCK_DATETIMEFORMAT = 'dd/MM/yyyy';
  static const String FILE_DATETIMEFORMAT = 'dd_MM_yyyy_hh_mm_ss';
  static const String WORKTIMEEXPORT_DATETIMEFORMAT = 'dd/MM/yyyy HH:mm';
  static const String DATETIMEFORMAT_VN = 'dd/MM/yyyy';

  static DateTime CURRENT_DATTETIME = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
}