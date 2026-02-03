import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/domain/enum/sensations.dart';

import 'item_sensation_widget.dart';

class ChooseSensationWidget extends StatelessWidget {

  final List<Sensations> sensations;
  final Sensations? selected;
  final void Function(Sensations) onChoose;

  const ChooseSensationWidget({
    super.key,
    required this.onChoose,
    required this.sensations,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: sensations.map(
        (e) => ItemSensationWidget(
          sensations: e,
          isSelected: selected == e,
          onSelected: (){
            onChoose(e);
          },
        )
      ).toList(),
    );
  }
}