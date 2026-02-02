import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/choose_emote_widget.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/note_block.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/slider_block.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extensions.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';

class JournalTab extends StatelessWidget {
  const JournalTab({super.key});

  @override
  Widget build(BuildContext context) {
    final noteController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: pagePadding),
              child: Text(
                "Что чувствуешь?",
                style: TS.titleBlock.use(context.palette.text)
              ),
            ),
            SizedBox(height: 20),
            ChooseEmoteWidget(
              onChoose: (emote){

              }
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.only(left: pagePadding),
              child: Text(
                "Уровень стресса",
                style: TS.titleBlock.use(context.palette.text)
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: pagePadding),
              child: SliderBlock(
                enabled: false,
                leftLabel: "Низкий",
                rightLabel: "Высокий",
              ),
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.only(left: pagePadding),
              child: Text(
                "Самооценка",
                style: TS.titleBlock.use(context.palette.text)
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: pagePadding),
              child: SliderBlock(
                leftLabel: "Неуверенность",
                rightLabel: "Уверенность",
              ),
            ),
            SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.only(left: pagePadding),
              child: Text(
                "Заметки",
                style: TS.titleBlock.use(context.palette.text)
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: pagePadding),
              child: NoteBlock(
                controller: noteController,
                onTextChanged: (newText){

                },
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: pagePadding),
              child: FilledButton(
                onPressed: (){

                },
                child: Text("Сохранить")
              ),
            ),
            SizedBox(height: 46),
          ],
        ),
      ),
    );
  }
}