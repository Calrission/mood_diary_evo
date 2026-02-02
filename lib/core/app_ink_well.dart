import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';

class AppInkWell extends StatelessWidget {

  final VoidCallback? onTap;
  final Widget child;
  final BorderRadius? borderRadius;

  const AppInkWell({super.key, this.onTap, required this.child, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        splashColor: context.palette.accent.withAlpha(128),
        highlightColor: context.palette.accent,
        borderRadius: borderRadius,
        child: child,
      ),
    );
  }

}