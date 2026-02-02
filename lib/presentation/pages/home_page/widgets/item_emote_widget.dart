import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/core/app_ink_well.dart';
import 'package:mood_diary_evo_test/domain/enum/emotes.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';

class ItemEmoteWidget extends StatelessWidget {

  final Emotes emote;
  final VoidCallback onChoose;
  final bool isSelected;

  const ItemEmoteWidget({
    super.key,
    required this.emote,
    required this.onChoose,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83,
      decoration: BoxDecoration(
        color: context.palette.block,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [context.palette.blockShadow],
        border: Border.all(
          color: (isSelected)
            ? context.palette.accent
            : Colors.transparent,
          width: 2
        )
      ),
      child: AppInkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onChoose,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(assetPath, width: 53, height: 50),
              Text(emote.name, style: TS.label.use(context.palette.text))
            ],
          ),
        ),
      ),
    );
  }

  String get assetPath => switch(emote) {
    Emotes.happy => "assets/images/happy.png",
    Emotes.fear => "assets/images/fear.png",
    Emotes.rabies => "assets/images/rabies.png",
    Emotes.sadness => "assets/images/sadness.png",
    Emotes.peace => "assets/images/peace.png",
    Emotes.strength => "assets/images/strength.png"
  };
}