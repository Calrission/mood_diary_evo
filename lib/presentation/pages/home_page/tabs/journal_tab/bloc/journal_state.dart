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
