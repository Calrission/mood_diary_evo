import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/domain/enum/emotes.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';

import 'item_emote_widget.dart';

class ChooseEmoteWidget extends StatelessWidget {

  final void Function(Emotes) onChoose;
  final Emotes? selected;

  const ChooseEmoteWidget({super.key, required this.onChoose, this.selected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        itemBuilder: (context, index) {
          final emote = Emotes.values[index];
          return ItemEmoteWidget(
            emote: emote,
            isSelected: selected == emote,
            onChoose: () => onChoose(emote)
          );
        },
        separatorBuilder: (_, _) => SizedBox(width: 12),
        itemCount: Emotes.values.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(
          left: pagePadding,
          right: pagePadding,
          bottom: 10
        ),
      ),
    );
  }
}