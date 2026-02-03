import 'package:datetime_loop/datetime_loop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/bloc/home_datetime_cubit/home_datetime_cubit.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/bloc/home_mode_cubit/home_mode_cubit.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab/journal_tab.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/statistic_tab.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/home_app_bar.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/home_mode_switcher.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = HomeModeCubit();

  final _modeToTab = const {
    HomeModeState.journal: JournalTab(),
    HomeModeState.statistic: StatisticTab(),
  };

  final _scrolledInTabs = {
    HomeModeState.journal: false,
    HomeModeState.statistic: false,
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocProvider(
        create: (context) => HomeDateTimeCubit(
          dateTimeLoopController: DateTimeLoopController(timeUnit: TimeUnit.minutes)
        ),
        child: Scaffold(
          appBar: HomeAppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Center(child: HomeModeSwitcher()),
              SizedBox(height: 15),
              NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification.metrics.axisDirection == AxisDirection.down ||
                      notification.metrics.axisDirection == AxisDirection.up) {
                    setState(() {
                      _scrolledInTabs[cubit.state] =
                          notification.metrics.pixels > 0;
                    });
                  }
                  return false;
                },
                child: Expanded(
                  child: BlocBuilder<HomeModeCubit, HomeModeState>(
                    builder: (context, state) {
                      int page = _modeToTab.keys.toList().indexOf(state);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedCrossFade(
                            duration: const Duration(milliseconds: 300),
                            crossFadeState: (_scrolledInTabs[cubit.state]!)
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            firstChild: Divider(
                                height: 2, color: context.palette.grey5),
                            secondChild: const SizedBox(height: 2),
                          ),
                          Expanded(
                            child: IndexedStack(
                              index: page,
                              children: _modeToTab.values.toList(),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
