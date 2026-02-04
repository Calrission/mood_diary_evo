import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab/bloc/journal_bloc.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab/widgets/choose_emote_widget.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab/widgets/choose_sensation_widget.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab/widgets/note_block.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab/widgets/slider_block.dart';
import 'package:mood_diary_evo_test/presentation/pages/home_page/tabs/journal_tab/widgets/success_dialog.dart';
import 'package:mood_diary_evo_test/presentation/widgets/loading_dialog.dart';
import 'package:mood_diary_evo_test/presentation/theme/app_theme_extension.dart';
import 'package:mood_diary_evo_test/presentation/theme/text_styles.dart';
import 'package:mood_diary_evo_test/presentation/theme/values.dart';
import 'package:mood_diary_evo_test/presentation/utils/exception_localizer.dart';

class JournalTab extends StatelessWidget {
  const JournalTab({super.key});

  @override
  Widget build(BuildContext context) {
    final journalBloc = context.read<JournalBloc>();
    final noteController = TextEditingController();
    final noteFocusNode = FocusNode();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: BlocConsumer<JournalBloc, JournalState>(
          listener: (context, state){
            if (state.builder.note != noteController.text){
              noteController.text = state.builder.note ?? "";
            }
            switch (state){
              case LoadingJournalState _:
                LoadingDialog.show(context: context);
              case ErrorJournalState s:
                final errorMessage = ExceptionLocalizer.localize(context, s.error);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(errorMessage))
                );
              case SuccessSendJournalState _:
                Navigator.of(context).pop();
                SuccessDialog.show(context: context).then((_) async {
                  journalBloc.add(ResetJournalEvent());
                  noteFocusNode.unfocus();
                });
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: pagePadding),
                  child: Text(
                    "Что чувствуешь?",
                    style: TS.titleBlock.use(context.palette.text)
                  ),
                ),
                const SizedBox(height: 20),
                ChooseEmoteWidget(
                  selected: state.builder.emote,
                  onChoose: (emote) {
                    journalBloc.add(
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
                              journalBloc.add(
                                ChooseSensationJournalEvent(sensation: sensation)
                              );
                            },
                          ),
                        ),
                      const SizedBox(height: 26),
                      Text(
                        "Уровень стресса",
                        style: TS.titleBlock.use(context.palette.text)
                      ),
                      const SizedBox(height: 20),
                      SliderBlock(
                        enabled: state.enableStress,
                        leftLabel: "Низкий",
                        rightLabel: "Высокий",
                        value: state.builder.stress ?? defaultStressLevel,
                        onChanged: (value){
                          journalBloc.add(
                            SetStressJournalEvent(stress: value)
                          );
                        },
                      ),
                      const SizedBox(height: 26),
                      Text(
                        "Самооценка",
                        style: TS.titleBlock.use(context.palette.text)
                      ),
                      const SizedBox(height: 20),
                      SliderBlock(
                        enabled: state.enableSelfRate,
                        leftLabel: "Неуверенность",
                        rightLabel: "Уверенность",
                        value: state.builder.selfRate ?? defaultSelfRate,
                        onChanged: (value){
                          journalBloc.add(
                              SetSelfRateJournalEvent(selfRate: value)
                          );
                        },
                      ),
                      const SizedBox(height: 36),
                      Text(
                        "Заметки",
                        style: TS.titleBlock.use(context.palette.text)
                      ),
                      const SizedBox(height: 20),
                      NoteBlock(
                        controller: noteController,
                        focusNode: noteFocusNode,
                        onTextChanged: (newText) {
                          journalBloc.add(
                              SetNoteJournalEvent(note: newText)
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: state.enableSaveButton ? () {
                          FocusScope.of(context).unfocus();
                          journalBloc.add(SaveJournalEvent());
                        } : null,
                        child: const Text("Сохранить")
                      ),
                      const SizedBox(height: 46),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}