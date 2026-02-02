import 'package:mood_diary_evo_test/domain/entity/mood.dart';
import 'package:mood_diary_evo_test/domain/enum/emotes.dart';
import 'package:mood_diary_evo_test/domain/enum/sensations.dart';

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

  MoodBuilder({
    Emotes? emote, Sensations? sensations, double? stress,
    double? selfRate, String? note
  }):
    _emote = emote, _sensations = sensations,
    _stress = stress, _selfRate = selfRate, _note = note;

  bool get isCompleted =>
    _emote != null &&
    _sensations != null &&
    _stress != null &&
    _selfRate != null &&
    _note != null
  ;

  MoodBuilder setEmote(Emotes emote) {
    _emote = emote;
    return this;
  }

  MoodBuilder setSensation(Sensations sensation) {
    _sensations = sensation;
    return this;
  }

  MoodBuilder setStress(double stress) {
    if (stress < 0 || stress > 1){
      throw "Stress should have a value between 0 and 1";
    }
    _stress = stress;
    return this;
  }

  MoodBuilder setSelfRate(double selfRate) {
    if (selfRate < 0 || selfRate > 1){
      throw "SelfRate should have a value between 0 and 1";
    }
    _selfRate = selfRate;
    return this;
  }

  MoodBuilder setNote(String note) {
    if (note.isEmpty){
      throw "Note should have a not empty value";
    }
    _note = note;
    return this;
  }

  Mood build() {
    if (_emote == null){
      throw "Emote is not filled";
    }
    if (_sensations == null){
      throw "Sensations is not filled";
    }
    if (_stress == null){
      throw "Stress is not filled";
    }
    if (_selfRate == null){
      throw "SelfRate is not filled";
    }
    if (_note == null){
      throw "Note is not filled";
    }
    return Mood(
      emote: _emote!,
      sensations: _sensations!,
      stress: _stress!,
      selfRate: _selfRate!,
      note: _note!
    );
  }
}