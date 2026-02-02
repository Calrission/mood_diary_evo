import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/home_page.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/slider_block.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extensions.dart';
import 'package:mood_diary_evo_test/presentation/theme/palette.dart';

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
          cursorColor: palette.accent,
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
            backgroundColor: palette.accent,
            foregroundColor: palette.textOnAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ),
    );
  }
}