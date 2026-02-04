import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'month_calendar.dart';

class ListYearCalendar extends StatelessWidget {

  final int year;
  final AutoScrollController _yearController;

  const ListYearCalendar({super.key,
    required this.year, required AutoScrollController controller
  }) : _yearController = controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: pagePadding,
        vertical: 22,
      ),
      child: ListView.separated(
        separatorBuilder: (_, _) => SizedBox(height: 28),
        itemBuilder: (context, index) {
          return AutoScrollTag(
            key: ValueKey(index),
            controller: _yearController,
            index: index,
            child: MonthCalendar(
              monthDateTime: DateTime(
                  year, index + 1, 1
              ),
            ),
          );
        },
        itemCount: 12,
        controller: _yearController
      ),
    );
  }
}