import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/presentation/pages/calendar_page/widgets/calendar_app_bar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(),

    );
  }
}