import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:mood_diary_evo_test/presentation/app.dart';

void main() async {
  Intl.systemLocale = await findSystemLocale();
  await initializeDateFormatting(Intl.systemLocale);
  runApp(const MyApp());
}
