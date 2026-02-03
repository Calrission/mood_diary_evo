import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String ddMMMMHHmm() => DateFormat("dd MMMM HH:mm", Intl.systemLocale).format(this);
  String ddMMMM() => DateFormat("dd MMMM", Intl.systemLocale).format(this);

  DateTime get onlyDate => DateTime(year, month, day);
}