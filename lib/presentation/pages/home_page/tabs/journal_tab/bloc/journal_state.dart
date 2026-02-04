part of 'journal_bloc.dart';

class JournalState extends Equatable {
  final MoodBuilder builder;

  const JournalState(this.builder);

  bool get showSensations => builder.emote != null;
  bool get enableStress => builder.sensation != null;
  bool get enableSelfRate => builder.sensation != null;
  bool get enableSaveButton=> builder.isCompleted;

  @override
  List<Object> get props => [builder];
}

class LoadingJournalState extends JournalState {
  const LoadingJournalState(super.builder);
}

class ErrorJournalState extends JournalState {
  final Object error;

  const ErrorJournalState(super.builder, this.error);
}

class SuccessSendJournalState extends JournalState {
  const SuccessSendJournalState(super.builder);
}