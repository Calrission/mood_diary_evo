// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Mood _$MoodFromJson(Map<String, dynamic> json) => _Mood(
  emote: $enumDecode(_$EmotesEnumMap, json['emote']),
  sensations: $enumDecode(_$SensationsEnumMap, json['sensations']),
  stress: (json['stress'] as num).toDouble(),
  selfRate: (json['selfRate'] as num).toDouble(),
  note: json['note'] as String,
  dateTime: DateTime.parse(json['dateTime'] as String),
);

Map<String, dynamic> _$MoodToJson(_Mood instance) => <String, dynamic>{
  'emote': _$EmotesEnumMap[instance.emote]!,
  'sensations': _$SensationsEnumMap[instance.sensations]!,
  'stress': instance.stress,
  'selfRate': instance.selfRate,
  'note': instance.note,
  'dateTime': instance.dateTime.toIso8601String(),
};

const _$EmotesEnumMap = {
  Emotes.happy: 'happy',
  Emotes.fear: 'fear',
  Emotes.rabies: 'rabies',
  Emotes.sadness: 'sadness',
  Emotes.peace: 'peace',
  Emotes.strength: 'strength',
};

const _$SensationsEnumMap = {
  Sensations.agitation: 'agitation',
  Sensations.delight: 'delight',
  Sensations.playfulness: 'playfulness',
  Sensations.enjoyment: 'enjoyment',
  Sensations.charm: 'charm',
  Sensations.mindfulness: 'mindfulness',
  Sensations.courage: 'courage',
  Sensations.pleasure: 'pleasure',
  Sensations.sensuality: 'sensuality',
  Sensations.energetic: 'energetic',
  Sensations.extravagance: 'extravagance',
};
