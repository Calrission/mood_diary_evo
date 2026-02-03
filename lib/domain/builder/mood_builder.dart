import 'package:mood_diary_evo_test/domain/entity/mood.dart';
import 'package:mood_diary_evo_test/domain/enum/emotes.dart';
import 'package:mood_diary_evo_test/domain/enum/sensations.dart';
import 'package:mood_diary_evo_test/domain/exceptions/not_filled_exception.dart';
import 'package:mood_diary_evo_test/domain/exceptions/wrong_order_exception.dart';

class MoodBuilder {
  final Emotes? _emote;
  Emotes? get emote => _emote;

  final Sensations? _sensations;
  Sensations? get sensation => _sensations;

  final double? _stress;
  double? get stress => _stress;

  final double? _selfRate;
  double? get selfRate => _selfRate;

  final String? _note;
  String? get note => _note;

  final DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;

  const MoodBuilder({
    Emotes? emote,
    Sensations? sensations,
    double? stress,
    double? selfRate,
    String? note,
    DateTime? dateTime
  }):
    _emote = emote,
    _sensations = sensations,
    _stress = stress,
    _selfRate = selfRate,
    _note = note,
    _dateTime = dateTime;

  bool get isCompleted =>
    _emote != null &&
    _sensations != null &&
    _stress != null &&
    _selfRate != null &&
    _note != null &&
    _dateTime != null
  ;

  MoodBuilder setEmote(Emotes emote) {
    // copyWith тут не используется из-за `sensations: null` т.к. при
    // изменении emote, старый sensations, который принадлежит прошлому emote,
    // должен сбрасываться до null - что не поддерживает copyWith.
    // (см. тест "Sensations is null when set new Emote")
    return MoodBuilder(
      emote: emote,
      sensations: null,
      stress: _stress,
      selfRate: _selfRate,
      note: _note,
      dateTime: _dateTime
    );
  }

  MoodBuilder setSensation(Sensations sensation) {
    if (emote == null){
      throw WrongOrderException("Sensations must be conveyed first than emote");
    }
    if (!emote!.sensations.contains(sensation)){
      throw WrongOrderException("Sensations must be contains in Emotes.sensations");
    }
    return copyWith(sensations: sensation);
  }

  MoodBuilder setStress(double stress) {
    if (stress < 0 || stress > 1){
      throw RangeError.range(stress, 0, 1, "stress");
    }
    return copyWith(stress: stress);
  }

  MoodBuilder setSelfRate(double selfRate) {
    if (selfRate < 0 || selfRate > 1){
      throw RangeError.range(selfRate, 0, 1, "selfRate");
    }
    return copyWith(selfRate: selfRate);
  }

  MoodBuilder setNote(String note) {
    if (note.isEmpty){
      // copyWith тут не используется из-за `note: null` т.к. при
      // изменении note, новый note может быть пустой строкой и в таком случае
      // его необходимо сбросить до null - что не поддерживает copyWith.
      // (см. тест "When note is empty - it convert to null")
      return MoodBuilder(
        emote: _emote,
        sensations: _sensations,
        stress: _stress,
        selfRate: _selfRate,
        note: null,
        dateTime: _dateTime
      );
    }
    return copyWith(note: note);
  }

  MoodBuilder setDateTime(DateTime dateTime){
    return copyWith(dateTime: dateTime);
  }

  Mood build() {
    if (_emote == null){
      throw NotFilledFieldException(field: "emote");
    }
    if (_sensations == null){
      throw NotFilledFieldException(field: "sensations");
    }
    if (_stress == null){
      throw NotFilledFieldException(field: "stress");
    }
    if (_selfRate == null){
      throw NotFilledFieldException(field: "selfRate");
    }
    if (_note == null){
      throw NotFilledFieldException(field: "note");
    }
    if (_dateTime == null){
      throw NotFilledFieldException(field: "dateTime");
    }
    return Mood(
      emote: _emote,
      sensations: _sensations,
      stress: _stress,
      selfRate: _selfRate,
      note: _note,
      dateTime: _dateTime
    );
  }

  MoodBuilder copyWith({
    Emotes? emote,
    Sensations? sensations,
    double? stress,
    double? selfRate,
    String? note,
    DateTime? dateTime,
  }) {
    return MoodBuilder(
      emote: emote ?? _emote,
      sensations: sensations ?? _sensations,
      stress: stress ?? _stress,
      selfRate: selfRate ?? _selfRate,
      note: note ?? _note,
      dateTime: dateTime ?? _dateTime
    );
  }
}