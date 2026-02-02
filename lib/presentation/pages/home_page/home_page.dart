import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SafeArea(child: Column()),
    );
  }
}