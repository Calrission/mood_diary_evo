import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/domain/enum/emotes.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';

import 'item_emote_widget.dart';

class ChooseEmoteWidget extends StatefulWidget {

  final void Function(Emotes) onChoose;

  const ChooseEmoteWidget({super.key, required this.onChoose});

  @override
  State<ChooseEmoteWidget> createState() => _ChooseEmoteWidgetState();
}

class _ChooseEmoteWidgetState extends State<ChooseEmoteWidget> {

  Emotes? currEmote;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        itemBuilder: (context, index) {
          final emote = Emotes.values[index];
          return ItemEmoteWidget(
            emote: emote,
            isSelected: currEmote == emote,
            onChoose: () {
              setState(() {
                currEmote = emote;
              });
              widget.onChoose(currEmote!);
            }
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