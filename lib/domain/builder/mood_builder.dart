import 'package:mood_diary_evo_test/domain/entity/mood.dart';
import 'package:mood_diary_evo_test/domain/enum/emotes.dart';
import 'package:mood_diary_evo_test/domain/enum/sensations.dart';
import 'package:mood_diary_evo_test/domain/exceptions/empty_exception.dart';
import 'package:mood_diary_evo_test/domain/exceptions/not_filled_exception.dart';
import 'package:mood_diary_evo_test/domain/exceptions/wrong_order_exception.dart';

class MoodBuilder {
  Emotes? _emote;
  Emotes? get emote => _emote;

  Sensations? _sensations;
  Sensations? get sensations => _sensations;

  double? _stress;
  double? get stress => _stress;

  double? _selfRate;
  double? get selfRate => _selfRate;

  String? _note;
  String? get note => _note;

  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;

  bool get isCompleted =>
    _emote != null &&
    _sensations != null &&
    _stress != null &&
    _selfRate != null &&
    _note != null &&
    _dateTime != null
  ;

  MoodBuilder setEmote(Emotes emote) {
    _emote = emote;
    return this;
  }

  MoodBuilder setSensation(Sensations sensation) {
    if (emote == null){
      throw WrongOrderException("Sensations must be conveyed first than emote");
    }
    if (!emote!.sensations.contains(sensation)){
      throw WrongOrderException("Sensations must be contains in Emotes.sensations");
    }
    _sensations = sensation;
    return this;
  }

  MoodBuilder setStress(double stress) {
    if (stress < 0 || stress > 1){
      throw RangeError.range(stress, 0, 1, "stress");
    }
    _stress = stress;
    return this;
  }

  MoodBuilder setSelfRate(double selfRate) {
    if (selfRate < 0 || selfRate > 1){
      throw RangeError.range(selfRate, 0, 1, "selfRate");
    }
    _selfRate = selfRate;
    return this;
  }

  MoodBuilder setNote(String note) {
    if (note.isEmpty){
      throw EmptyFieldException(field: "note");
    }
    _note = note;
    return this;
  }

  MoodBuilder setDateTime(DateTime dateTime){
    _dateTime = dateTime;
    return this;
  }

  Mood build() {
    if (_emote == null){
      throw NotFilledFieldException(field: "emote ");
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
      emote: _emote!,
      sensations: _sensations!,
      stress: _stress!,
      selfRate: _selfRate!,
      note: _note!,
      dateTime: _dateTime!
    );
  }
}