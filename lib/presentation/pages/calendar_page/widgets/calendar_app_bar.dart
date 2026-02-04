import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_diary_evo_test/presentation/pages/calendar_page/bloc/calendar_mode_cubit.dart';
import 'package:mood_diary_evo_test/presentation/pages/calendar_page/enum/calendar_mode.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';
import 'package:mood_diary_evo_test/presentation/widgets/app_ink_well.dart';

class CalendarAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CalendarAppBar({super.key, required this.onTodayTap});

  final VoidCallback onTodayTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 67,
        left: calendarAppBarLeftOffset,
        right: pagePadding
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            spacing: 8,
            children: [
              AppInkWell(
                borderRadius: BorderRadius.circular(90),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  padding: EdgeInsets.all(10),
                  child: SvgPicture.asset("assets/icons/close.svg")
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: onTodayTap,
                    child: Text(
                      "Сегодня",
                      style: TS.calendarToday.use(context.palette.grey2)
                    ),
                  ),
                )
              )
            ],
          ),
          SizedBox(height: 18),
          BlocBuilder<CalendarModeCubit, CalendarMode>(
            builder: (context, state) {
              switch(state){
                case CalendarMode.list:
                  return Padding(
                    padding: EdgeInsets.only(left: calendarWeekdayLeftOffset, bottom: 8),
                    child: Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _WeekdayCalendarItem(text: "ПН"),
                        _WeekdayCalendarItem(text: "ВТ"),
                        _WeekdayCalendarItem(text: "СР"),
                        _WeekdayCalendarItem(text: "ЧТ"),
                        _WeekdayCalendarItem(text: "ПТ"),
                        _WeekdayCalendarItem(text: "СБ"),
                        _WeekdayCalendarItem(text: "ВС"),
                      ],
                    ),
                  );
                case CalendarMode.grid:
                  return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(110);
}

class _WeekdayCalendarItem extends StatelessWidget {

  final String text;

  const _WeekdayCalendarItem({required this.text});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery
        .sizeOf(context)
        .width;
    final cellW = (w - calendarWeekdayLeftOffset - calendarAppBarLeftOffset -
        pagePadding - 6 * calendarPaddingBetweenDays) / 7;
    return SizedBox(
        width: cellW,
        child: Center(
          child: Text(
            text,
            style: TS.calendarWeekdays.use(context.palette.grey2)
          ),
        )
    );
  }
}