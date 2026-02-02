import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/bloc/home_mode_cubit.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/statistic_tab.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/home_app_bar.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/home_mode_switcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final _modeToTab = const {
    HomeModeState.journal: JournalTab(),
    HomeModeState.statistic: StatisticTab()
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeModeCubit(),
      child: Scaffold(
        appBar: HomeAppBar(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Center(child: HomeModeSwitcher()),
              SizedBox(height: 30),
              Expanded(child:
              BlocBuilder<HomeModeCubit, HomeModeState>(
                builder: (context, state) {
                  int page = _modeToTab.keys.toList().indexOf(state);
                  return IndexedStack(
                    index: page,
                    children: _modeToTab.values.toList(),
                  );
                },
              )
              )
            ],
          )
        ),
      ),
    );
  }
}