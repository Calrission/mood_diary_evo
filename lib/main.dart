import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:mood_diary_evo_test/data/repository/mood_repository.dart';
import 'package:mood_diary_evo_test/domain/repository/mood_repository.dart';
import 'package:mood_diary_evo_test/domain/use_case/send_mood_use_case.dart';
import 'package:mood_diary_evo_test/presentation/app.dart';

void main() async {
  Intl.systemLocale = await findSystemLocale();
  await initializeDateFormatting(Intl.systemLocale);

  GetIt.I.registerSingleton<MoodRepository>(MoodRepositoryImpl());
  GetIt.I.registerSingleton(SendMoodUseCase());

  runApp(const MyApp());
}
