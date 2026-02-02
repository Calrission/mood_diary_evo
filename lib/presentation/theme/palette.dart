import 'package:flutter/material.dart';

class Palette {
  final Color accent;
  final Color text;
  final Color textOnAccent;
  final Color grey1;
  final Color grey2;
  final Color grey3;
  final Color grey4;
  final Color background;

  final LinearGradient orangeGradient;

  final BoxShadow blockShadow;

  const Palette({
    required this.background,
    required this.grey1,
    required this.grey2,
    required this.grey3,
    required this.grey4,
    required this.text,
    required this.orangeGradient,
    required this.accent,
    required this.textOnAccent,
    required this.blockShadow,
  });

  const Palette.light(): this(
    background: const Color(0xFFFFFDFC),
    grey1: const Color(0xFF98A1AA),
    grey2: const Color(0xFFBCBCBF),
    grey3: const Color(0xFFE8E8E8),
    grey4: const Color(0xFFF2F2F2),
    text: const Color(0xFF4C4C69),
    accent: const Color(0xFFFF8702),
    textOnAccent: const Color(0xFFFFFFFF),
    orangeGradient: const LinearGradient(colors: []),
    blockShadow: const BoxShadow(
      color: Color(0x1CB6A1C0),
      offset: Offset(2, 4),
      blurRadius: 10.8
    )
  );

  Palette lerp(Palette other, double t) {
    return Palette(
      background: Color.lerp(background, other.background, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      grey1: Color.lerp(grey1, other.grey1, t)!,
      grey2: Color.lerp(grey2, other.grey2, t)!,
      grey3: Color.lerp(grey3, other.grey3, t)!,
      grey4: Color.lerp(grey4, other.grey4, t)!,
      text: Color.lerp(text, other.text, t)!,
      textOnAccent: Color.lerp(textOnAccent, other.textOnAccent, t)!,
      orangeGradient: LinearGradient(
        colors: orangeGradient.colors.indexed.map<Color>(
          (e) => Color.lerp(e.$2, other.orangeGradient.colors[e.$1], t)!
        ).toList()
      ),
      blockShadow: blockShadow.copyWith(
        color: Color.lerp(blockShadow.color, other.blockShadow.color, t)!
      )
    );
  }
}

