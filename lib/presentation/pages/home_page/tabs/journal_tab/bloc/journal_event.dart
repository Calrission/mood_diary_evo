part of 'journal_bloc.dart';

sealed class JournalEvent extends Equatable {
  const JournalEvent();
}

final class ChooseEmoteJournalEvent extends JournalEvent {
  final Emotes emote;

  const ChooseEmoteJournalEvent({required this.emote});

  @override
  List<Object?> get props => [emote];
}

final class ChooseSensationJournalEvent extends JournalEvent {
  final Sensations sensation;

  const ChooseSensationJournalEvent({required this.sensation});

  @override
  List<Object?> get props => [sensation];
}

final class SetStressJournalEvent extends JournalEvent {
  final double stress;

  const SetStressJournalEvent({required this.stress});

  @override
  List<Object?> get props => [stress];
}

final class SetSelfRateJournalEvent extends JournalEvent {
  final double selfRate;

  const SetSelfRateJournalEvent({required this.selfRate});

  @override
  List<Object?> get props => [selfRate];
}

final class SetNoteJournalEvent extends JournalEvent {
  final String note;

  const SetNoteJournalEvent({required this.note});

  @override
  List<Object?> get props => [note];
}

final class SetDateTimeJournalEvent extends JournalEvent {
  final DateTime dateTime;

  const SetDateTimeJournalEvent({required this.dateTime});

  @override
  List<Object?> get props => [dateTime];
}

final class SaveJournalEvent extends JournalEvent {
  @override
  List<Object?> get props => [];
}

final class ResetJournalEvent extends JournalEvent {
  @override
  List<Object?> get props => [];
}

