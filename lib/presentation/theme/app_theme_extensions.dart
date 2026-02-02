import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/presentation/theme/palette.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Palette palette;

  const AppThemeExtension({required this.palette});

  @override
  ThemeExtension<AppThemeExtension> lerp(
    covariant ThemeExtension<AppThemeExtension>? other,
    double t
  ) {
    if (other is! AppThemeExtension) return this;

    return AppThemeExtension(
      palette: palette.lerp(other.palette, t),
    );
  }

  @override
  AppThemeExtension copyWith({Palette? palette}) {
    return AppThemeExtension(
      palette: palette ?? this.palette,
    );
  }
}

extension InContext on BuildContext {
  AppThemeExtension get appTheme => Theme.of(this).extension<AppThemeExtension>()!;
  Palette get palette => appTheme.palette;
}