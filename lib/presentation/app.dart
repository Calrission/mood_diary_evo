import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/home_page.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab/widgets/slider_block.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/palette.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appThemeExtension = AppThemeExtension(palette: Palette.light());
    final palette = appThemeExtension.palette;
    return MaterialApp(
      title: 'Flutter Demo',
      home: const HomePage(),
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: palette.accent),
        extensions: [appThemeExtension],
        iconTheme: IconThemeData(
          color: palette.grey2
        ),
        primaryColor: palette.accent,
        scaffoldBackgroundColor: palette.background,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: palette.text,
          selectionColor: palette.accent.withAlpha(48),
          selectionHandleColor: palette.accent,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: palette.accent,
        ),
        sliderTheme: SliderThemeData(
          trackHeight: 6,
          activeTrackColor: palette.accent,
          disabledActiveTrackColor: palette.grey5,
          inactiveTrackColor: palette.grey5,
          thumbColor: palette.accent,
          disabledThumbColor: palette.grey5,
          overlayColor: palette.accent.withAlpha(32),
          thumbShape: RingSliderThumbShape(
            strokeColor: palette.block
          ),
          activeTickMarkColor: Colors.transparent,
          overlappingShapeStrokeColor: Colors.transparent,
          secondaryActiveTrackColor: Colors.transparent,
          valueIndicatorColor: Colors.transparent,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: Size.fromHeight(44),
            backgroundColor: palette.accent,
            foregroundColor: palette.textOnAccent,
            padding: EdgeInsets.symmetric(vertical: 15),
            textStyle: TS.button,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(59),
            ),
          ),
        )
      ),
    );
  }
}