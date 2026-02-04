import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';

class StatisticTab extends StatelessWidget {
  const StatisticTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 128),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/sadness.png", width: 150, height: 150),
              Text(
                "Статистика пока недоступна",
                style: TS.title.use(context.palette.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}