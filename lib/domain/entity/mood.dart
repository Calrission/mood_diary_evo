import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mood_diary_evo_test/domain/enum/emotes.dart';
import 'package:mood_diary_evo_test/domain/enum/sensations.dart';

part 'mood.freezed.dart';
part 'mood.g.dart';

@freezed
abstract class Mood with _$Mood {
  const factory Mood({
    required Emotes emote,
    required Sensations sensations,
    required double stress,
    required double selfRate,
    required String note,
    required DateTime dateTime
  }) = _Mood;

  factory Mood.fromJson(Map<String, dynamic> json) => _$MoodFromJson(json);
}