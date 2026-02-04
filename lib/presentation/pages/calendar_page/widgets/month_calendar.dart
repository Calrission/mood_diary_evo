import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary_evo_test/core/extensions/date_time_extension.dart';
import 'package:mood_diary_evo_test/core/extensions/strings_extension.dart';
import 'package:mood_diary_evo_test/presentation/pages/calendar_page/bloc/calendar_mode_cubit.dart';
import 'package:mood_diary_evo_test/presentation/pages/calendar_page/widgets/cell_calendar.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/bloc/home_datetime_cubit/home_datetime_cubit.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';

class MonthCalendar extends StatelessWidget {
  final DateTime monthDateTime;

  final bool isNormal;

  const MonthCalendar({
    super.key,
    required this.monthDateTime,
    this.isNormal = true,
  });

  int _getCountDays() => DateUtils.getDaysInMonth(
      monthDateTime.year, monthDateTime.month
  );

  int _getOffset(BuildContext context) =>
      monthDateTime.copyWith(day: 1).weekday - 2;

  void onPressToChangeCalendarMode(BuildContext context){
    context.read<CalendarModeCubit>().toggleMode();
  }

  @override
  Widget build(BuildContext context) {
    int countDays = _getCountDays();
    int offset = _getOffset(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isNormal)
          GestureDetector(
            onTap: () => onPressToChangeCalendarMode(context),
            child: Text(
              monthDateTime.year.toString(),
              style: TS.listCalendarYear.use(context.palette.grey2),
            ),
          ),
        SizedBox(height: 12),
        GestureDetector(
          onTap: () => onPressToChangeCalendarMode(context),
          child: Text(
            DateFormat.MMMM().format(monthDateTime).toTitle(),
            style: ((isNormal) ? TS.listMonth : TS.gridMonth).use(context.palette.text),
          ),
        ),
        SizedBox(height: 17),
        BlocBuilder<HomeDateTimeCubit, HomeDateTimeState>(
            buildWhen: (previous, current) =>
            previous.dateTime.month == monthDateTime.month ||
                current.dateTime.month == monthDateTime.month,
            builder: (BuildContext context, HomeDateTimeState state) {
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemCount: countDays + offset + 1,
                itemBuilder: (context, index) {
                  final dayInMonth = index - offset;
                  final DateTime? dayDateTime;
                  if (dayInMonth > 0) {
                    dayDateTime = monthDateTime.copyWith(day: dayInMonth);
                  } else {
                    dayDateTime = null;
                  }
                  return CellCalendar(
                    dayDateTime: dayDateTime,
                    numberTextStyle: ((isNormal) ? TS.listNumber : TS.gridNumber).use(context.palette.text),
                    showTodayIndicator: isNormal,
                    isSelected: context.read<HomeDateTimeCubit>()
                        .state.dateTime.onlyDate == dayDateTime?.onlyDate,
                  );
                },
              );
            }
        )
      ],
    );
  }
}