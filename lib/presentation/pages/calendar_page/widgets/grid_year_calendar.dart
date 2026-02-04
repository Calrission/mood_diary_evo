import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary_evo_test/presentation/pages/calendar_page/bloc/calendar_mode_cubit.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'month_calendar.dart';

class GridYearCalendar extends StatelessWidget {
  final int year;
  final AutoScrollController _yearController;

  const GridYearCalendar({super.key,
    required this.year, required AutoScrollController controller
  }) : _yearController = controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: pagePadding,
        vertical: 12,
      ),
      child: ListView(
        children: [
          GestureDetector(
            onTap: (){
              context.read<CalendarModeCubit>().toggleMode();
            },
            child: Text(
              year.toString(),
              textAlign: TextAlign.center,
              style: TS.gridCalendarYear.use(context.palette.text)
            ),
          ),
          SizedBox(height: 26),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 12/14,
              crossAxisSpacing: 32
            ),
            itemCount: 12,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return AutoScrollTag(
                key: ValueKey(index),
                controller: _yearController,
                index: index,
                child: MonthCalendar(
                  isNormal: false,
                  monthDateTime: DateTime(
                    year, index + 1, 1
                  ),
                ),
              );
            },
          ),
        ],
      )
    );
  }
}