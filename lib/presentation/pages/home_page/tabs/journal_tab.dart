import 'package:flutter/material.dart';
import 'package:mood_diary_evo_test/domain/enum/emotes.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/widgets/item_emote_widget.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extensions.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';

class JournalTab extends StatelessWidget {
  const JournalTab({super.key});

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 130,
              child: ListView.separated(
                itemBuilder: (context, index) =>
                  ItemEmoteWidget(emote: Emotes.values[index]),
                separatorBuilder: (_, _) => SizedBox(width: 12),
                itemCount: Emotes.values.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left: pagePadding,
                  right: pagePadding,
                  bottom: 10
                ),
              ),
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.only(left: pagePadding),
              child: Text(
                "Уровень стресса",
                style: TS.titleBlock.use(context.palette.text)
              ),
            ),
          ],
        ),
      ),
    );
  }
}