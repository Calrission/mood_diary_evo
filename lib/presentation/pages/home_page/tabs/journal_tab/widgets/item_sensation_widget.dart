import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/core/widgets/app_ink_well.dart';
import 'package:mood_diary_evo_test/domain/enum/sensations.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';

class ItemSensationWidget extends StatelessWidget {
  final Sensations sensations;
  final bool isSelected;
  final void Function() onSelected;

  const ItemSensationWidget({
    super.key,
    required this.sensations,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (isSelected)
          ? context.palette.accent
          : context.palette.block,
        borderRadius: BorderRadius.circular(3)
      ),
      child: AppInkWell(
        onTap: onSelected,
        borderRadius: BorderRadius.circular(3),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 3
          ),
          child: Text(
            sensations.name,
            style: TS.tab.use(
              (isSelected)
                ? context.palette.textOnAccent
                : context.palette.text
            )
          ),
        ),
      )
    );
  }
}