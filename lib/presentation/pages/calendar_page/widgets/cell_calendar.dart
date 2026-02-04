import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/bloc/home_datetime_cubit/home_datetime_cubit.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/widgets/app_ink_well.dart';

class CellCalendar extends StatelessWidget {
  final DateTime? dayDateTime;
  final bool isSelected;

  final TextStyle numberTextStyle;
  final bool showTodayIndicator;

  const CellCalendar({
    super.key,
    required this.dayDateTime,
    required this.isSelected,
    required this.numberTextStyle,
    this.showTodayIndicator = true,
  });

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
                style: numberTextStyle,
              ),
              if (showTodayIndicator)
                ClipOval(
                  child: Container(
                    width: 5, height: 5,
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