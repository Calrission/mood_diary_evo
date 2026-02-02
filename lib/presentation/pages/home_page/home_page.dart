import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/bloc/home_mode_cubit.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/home_app_bar.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/home_mode_switcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeModeCubit(),
      child: Scaffold(
        appBar: HomeAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 24),
                  HomeModeSwitcher(),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}