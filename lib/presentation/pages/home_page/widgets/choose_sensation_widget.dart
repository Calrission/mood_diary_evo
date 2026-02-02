import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/domain/enum/sensations.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/item_sensation_widget.dart';

class ChooseSensationWidget extends StatefulWidget {

  final void Function(Sensations) onChoose;

  const ChooseSensationWidget({super.key, required this.onChoose});

  @override
  State<ChooseSensationWidget> createState() => _ChooseSensationWidgetState();
}

class _ChooseSensationWidgetState extends State<ChooseSensationWidget> {

  Sensations? selected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: Sensations.values.map(
        (e) => ItemSensationWidget(
          sensations: e,
          isSelected: selected == e,
          onSelected: (){
            setState(() {
              selected = e;
            });
            widget.onChoose(e);
          },
        )
      ).toList(),
    );
  }
}