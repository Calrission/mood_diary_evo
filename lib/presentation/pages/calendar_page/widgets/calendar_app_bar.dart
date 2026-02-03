import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';
import 'package:mood_diary_evo_test/presentation/widgets/app_ink_well.dart';

class CalendarAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CalendarAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 49,
        left: 10,
        bottom: 8,
        right: pagePadding
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              AppInkWell(
                borderRadius: BorderRadius.circular(90),
                onTap: (){

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
                  child: Text(
                    "Сегодня",
                    style: TS.calendarToday.use(context.palette.grey2)
                  ),
                )
              )
            ],
          ),
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
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
    return Text(text, style: TS.calendarWeekdays.use(context.palette.grey2));
  }
}