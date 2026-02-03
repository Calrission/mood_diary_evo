import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary_evo_test/core/extensions/date_time_extension.dart';
import 'package:mood_diary_evo_test/core/extensions/strings_extension.dart';
import 'package:mood_diary_evo_test/presentation/pages/calendar_page/widgets/calendar_app_bar.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/bloc/home_datetime_cubit/home_datetime_cubit.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';
import 'package:mood_diary_evo_test/presentation/widgets/app_ink_well.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({super.key});

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        onTodayTap: (){
          final currentDateTime = DateTime.now();
          context.read<HomeDateTimeCubit>().setDateTime(currentDateTime);
          _controller.jumpTo(
            (currentDateTime.month - 1) * 300
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: pagePadding,
          vertical: 12,
        ),
        child: CustomScrollView(
          controller: _controller,
          slivers: List.generate(12, (index) {
            return SliverPadding(
              padding: const EdgeInsets.only(bottom: 28),
              sliver: _MonthCalendarItem(
                monthDateTime: context.read<HomeDateTimeCubit>().state.dateTime.copyWith(
                  month: index + 1
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _MonthCalendarItem extends StatelessWidget {
  final DateTime monthDateTime;

  const _MonthCalendarItem({
    super.key,
    required this.monthDateTime,
  });

  int _getCountDays() => DateUtils.getDaysInMonth(
    monthDateTime.year, monthDateTime.month
  );

  int _getOffset(BuildContext context) =>
      monthDateTime.copyWith(day: 1).weekday - 2;

  @override
  Widget build(BuildContext context) {
    int countDays = _getCountDays();
    int offset = _getOffset(context);
    final cubit = context.read<HomeDateTimeCubit>();
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                monthDateTime.year.toString(),
                style: TS.calendarYear.use(context.palette.grey2),
              ),
              SizedBox(height: 12),
              Text(
                DateFormat.MMMM().format(monthDateTime).toTitle(),
                style: TS.calendarMonth.use(context.palette.text),
              ),
              SizedBox(height: 17),
            ],
          ),
        ),
        BlocBuilder<HomeDateTimeCubit, HomeDateTimeState>(
          buildWhen: (previous, current) =>
            previous.dateTime.month == monthDateTime.month ||
            current.dateTime.month == monthDateTime.month,
          builder: (BuildContext context, HomeDateTimeState state) {
            return SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: calendarPaddingBetweenDays,
                mainAxisSpacing: calendarPaddingBetweenDays,
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
                return _CellCalendar(
                  dayDateTime: dayDateTime,
                  isSelected: cubit.state.dateTime.onlyDate == dayDateTime?.onlyDate,
                );
              },
            );
          }
        )
      ],
    );
  }
}

class _CellCalendar extends StatelessWidget {
  final DateTime? dayDateTime;
  final bool isSelected;

  const _CellCalendar({required this.dayDateTime, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: (dayDateTime != null) ? (){
        context.read<HomeDateTimeCubit>().setDateTime(dayDateTime!);
      } : null,
      borderRadius: BorderRadius.circular(180),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(180),
          color: (isSelected)
              ? context.palette.accent.withAlpha(64)
              : Colors.transparent,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                dayDateTime?.day.toString() ?? "",
                style: TS.calendarNumber.use(context.palette.text),
              ),
              ClipOval(
                child: Container(
                  width: 5,
                  height: 5,
                  color: (isSelected)
                      ? context.palette.accent
                      : Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
