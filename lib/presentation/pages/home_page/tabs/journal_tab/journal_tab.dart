import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab/bloc/journal_bloc/journal_bloc.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab/widgets/choose_emote_widget.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab/widgets/choose_sensation_widget.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab/widgets/note_block.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab/widgets/slider_block.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';

class JournalTab extends StatelessWidget {
  const JournalTab({super.key});

  @override
  Widget build(BuildContext context) {
    final noteController = TextEditingController();
    return BlocProvider(
      create: (context) => JournalBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<JournalBloc, JournalState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: pagePadding),
                    child: Text(
                      "Что чувствуешь?",
                      style: TS.titleBlock.use(context.palette.text)
                    ),
                  ),
                  SizedBox(height: 20),
                  ChooseEmoteWidget(
                    onChoose: (emote) {
                      context.read<JournalBloc>().add(
                        ChooseEmoteJournalEvent(emote: emote)
                      );
                    }
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: pagePadding
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state.showSensations)
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: ChooseSensationWidget(
                              selected: state.builder.sensation,
                              sensations: state.builder.emote!.sensations,
                              onChoose: (sensation) {
                                context.read<JournalBloc>().add(
                                  ChooseSensationJournalEvent(sensation: sensation)
                                );
                              },
                            ),
                          ),
                        SizedBox(height: 26),
                        Text(
                          "Уровень стресса",
                          style: TS.titleBlock.use(context.palette.text)
                        ),
                        SizedBox(height: 20),
                        SliderBlock(
                          enabled: state.enableStress,
                          leftLabel: "Низкий",
                          rightLabel: "Высокий",
                          value: state.builder.stress ?? 0.5,
                          onChanged: (value){
                            context.read<JournalBloc>().add(
                              SetStressJournalEvent(stress: value)
                            );
                          },
                        ),
                        SizedBox(height: 26),
                        Text(
                          "Самооценка",
                          style: TS.titleBlock.use(context.palette.text)
                        ),
                        SizedBox(height: 20),
                        SliderBlock(
                          enabled: state.enableSelfRate,
                          leftLabel: "Неуверенность",
                          rightLabel: "Уверенность",
                          value: state.builder.selfRate ?? 0.5,
                          onChanged: (value){
                            context.read<JournalBloc>().add(
                              SetSelfRateJournalEvent(selfRate: value)
                            );
                          },
                        ),
                        SizedBox(height: 36),
                        Text(
                          "Заметки",
                          style: TS.titleBlock.use(context.palette.text)
                        ),
                        SizedBox(height: 20),
                        NoteBlock(
                          controller: noteController,
                          onTextChanged: (newText) {
                            context.read<JournalBloc>().add(
                              SetNoteJournalEvent(note: newText)
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        FilledButton(
                          onPressed: state.enableSaveButton ? () {

                          } : null,
                          child: Text("Сохранить")
                        ),
                        SizedBox(height: 46),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}