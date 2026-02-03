import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary_evo_test/domain/builder/mood_builder.dart';
import 'package:mood_diary_evo_test/domain/enum/emotes.dart';
import 'package:mood_diary_evo_test/domain/enum/sensations.dart';

part 'journal_event.dart';
part 'journal_state.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {

  static final _defaultMoodBuilder = MoodBuilder(
    selfRate: 0.5,
    stress: 0.5,
    dateTime: DateTime(2026, 01, 01)
  );


  JournalBloc() : super(JournalState(_defaultMoodBuilder)) {
    on<ChooseEmoteJournalEvent>((event, emit) {
      emit(JournalState(state.builder.setEmote(event.emote)));
    });
    on<ChooseSensationJournalEvent>((event, emit) {
      emit(JournalState(state.builder.setSensation(event.sensation)));
    });
    on<SetStressJournalEvent>((event, emit) {
      emit(JournalState(state.builder.setStress(event.stress)));
    });
    on<SetSelfRateJournalEvent>((event, emit) {
      emit(JournalState(state.builder.setSelfRate(event.selfRate)));
    });
    on<SetNoteJournalEvent>((event, emit) {
      emit(JournalState(state.builder.setNote(event.note)));
    });
    on<SaveJournalEvent>((event, emit) {
      emit(JournalState(_defaultMoodBuilder));
    });
  }
}
