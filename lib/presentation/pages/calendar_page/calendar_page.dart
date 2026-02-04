import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary_evo_test/presentation/pages/calendar_page/bloc/calendar_mode_cubit.dart';
import 'package:mood_diary_evo_test/presentation/pages/calendar_page/enum/calendar_mode.dart';
import 'package:mood_diary_evo_test/presentation/pages/calendar_page/widgets/calendar_app_bar.dart';
import 'package:mood_diary_evo_test/presentation/pages/calendar_page/widgets/grid_year_calendar.dart';
import 'package:mood_diary_evo_test/presentation/pages/calendar_page/widgets/list_year_calendar.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/bloc/home_datetime_cubit/home_datetime_cubit.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final yearController = AutoScrollController();
    final pageController = PageController(
      initialPage: context.read<HomeDateTimeCubit>().state.dateTime.year - 1
    );
    return Scaffold(
      appBar: CalendarAppBar(
        onTodayTap: (){
          final currentDateTime = DateTime.now();
          context.read<HomeDateTimeCubit>().setDateTime(currentDateTime);
          if ((pageController.page ?? 0) + 1 == currentDateTime.year){
            pageController.jumpToPage(currentDateTime.year - 1);
            Future.delayed(Duration(milliseconds: 200)).then((_){
              if (context.mounted){
                yearController.scrollToIndex(currentDateTime.month - 1);
              }
            });
            return;
          }else{
            yearController.scrollToIndex(currentDateTime.month - 1);
          }

        },
      ),
      body: BlocBuilder<CalendarModeCubit, CalendarMode>(
        builder: (context, state) {
          return PageView.builder(
            controller: pageController,
            itemBuilder: (BuildContext context, int index) {
              switch (state){
                case CalendarMode.list:
                  return ListYearCalendar(
                    year: index + 1,
                    controller: yearController
                  );
                case CalendarMode.grid:
                  return GridYearCalendar(
                    year: index + 1,
                    controller: yearController
                  );
              }
            },
            itemCount: 9999,
          );
        },
      )
    );
  }
}
