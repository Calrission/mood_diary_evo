import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_diary_evo_test/domain/builder/mood_builder.dart';
import 'package:mood_diary_evo_test/domain/enum/emotes.dart';
import 'package:mood_diary_evo_test/domain/enum/sensations.dart';
import 'package:mood_diary_evo_test/domain/use_case/send_mood_use_case.dart';

part 'journal_event.dart';
part 'journal_state.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {

  final MoodBuilder _defaultMoodBuilder;
  final SendMoodUseCase _useCase;

  JournalBloc(
    this._defaultMoodBuilder,
    [SendMoodUseCase? useCase]
  ): _useCase = useCase ?? GetIt.I.get(), super(JournalState(_defaultMoodBuilder)) {

    on<ChooseEmoteJournalEvent>((event, emit) {
      try {
        emit(JournalState(state.builder.setEmote(event.emote)));
      } on Object catch(e){
        emit(ErrorJournalState(state.builder, e));
      }
    });

    on<ChooseSensationJournalEvent>((event, emit) {
      try {
        emit(JournalState(state.builder.setSensation(event.sensation)));
      } on Object catch(e){
        emit(ErrorJournalState(state.builder, e));
      }
    });

    on<SetStressJournalEvent>((event, emit) {
      try {
        emit(JournalState(state.builder.setStress(event.stress)));
      } on Object catch(e){
        emit(ErrorJournalState(state.builder, e));
      }
    });

    on<SetSelfRateJournalEvent>((event, emit) {
      try {
        emit(JournalState(state.builder.setSelfRate(event.selfRate)));
      } on Object catch(e){
        emit(ErrorJournalState(state.builder, e));
      }
    });

    on<SetNoteJournalEvent>((event, emit) {
      try {
        emit(JournalState(state.builder.setNote(event.note)));
      } on Object catch(e){
        emit(ErrorJournalState(state.builder, e));
      }
    });

    on<SetDateTimeJournalEvent>((event, emit) {
      try {
        emit(JournalState(state.builder.setDateTime(event.dateTime)));
      } on Object catch(e){
        emit(ErrorJournalState(state.builder, e));
      }
    });

    on<SaveJournalEvent>((event, emit) async {
      try {
        emit(LoadingJournalState(state.builder));
        final mood = state.builder.build();
        await _useCase.call(mood);
        emit(SuccessSendJournalState(state.builder));
      } on Object catch(e){
        emit(ErrorJournalState(state.builder, e));
      }
    });

    on<ResetJournalEvent>((event, emit) async {
      emit(JournalState(
        _defaultMoodBuilder.copyWith(dateTime: state.builder.dateTime))
      );
    });
  }
}
