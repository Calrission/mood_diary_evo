import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String ddMMMMHHmm() => DateFormat("dd MMMM HH:mm", Intl.systemLocale).format(this);
}