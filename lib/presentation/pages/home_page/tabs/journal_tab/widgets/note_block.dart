import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';

class NoteBlock extends StatelessWidget {

  final TextEditingController controller;
  final void Function(String) onTextChanged;

  const NoteBlock({
    super.key,
    required this.controller,
    required this.onTextChanged
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 90
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: context.palette.block,
          boxShadow: [context.palette.blockShadow]
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10
        ),
        child: TextField(
          controller: controller,
          onChanged: onTextChanged,
          maxLines: null,
          style: TS.text.use(context.palette.text),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            hint: Text(
              "Введите заметку",
              style: TS.text.use(context.palette.grey2)
            ),
            isDense: true
          ),
        ),
      ),
    );
  }

}