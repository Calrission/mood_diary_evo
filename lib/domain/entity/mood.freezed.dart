// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Mood {

 Emotes get emote; Sensations get sensations; double get stress; double get selfRate; String get note; DateTime get dateTime;
/// Create a copy of Mood
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoodCopyWith<Mood> get copyWith => _$MoodCopyWithImpl<Mood>(this as Mood, _$identity);

  /// Serializes this Mood to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Mood&&(identical(other.emote, emote) || other.emote == emote)&&(identical(other.sensations, sensations) || other.sensations == sensations)&&(identical(other.stress, stress) || other.stress == stress)&&(identical(other.selfRate, selfRate) || other.selfRate == selfRate)&&(identical(other.note, note) || other.note == note)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,emote,sensations,stress,selfRate,note,dateTime);

@override
String toString() {
  return 'Mood(emote: $emote, sensations: $sensations, stress: $stress, selfRate: $selfRate, note: $note, dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class $MoodCopyWith<$Res>  {
  factory $MoodCopyWith(Mood value, $Res Function(Mood) _then) = _$MoodCopyWithImpl;
@useResult
$Res call({
 Emotes emote, Sensations sensations, double stress, double selfRate, String note, DateTime dateTime
});




}
/// @nodoc
class _$MoodCopyWithImpl<$Res>
    implements $MoodCopyWith<$Res> {
  _$MoodCopyWithImpl(this._self, this._then);

  final Mood _self;
  final $Res Function(Mood) _then;

/// Create a copy of Mood
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emote = null,Object? sensations = null,Object? stress = null,Object? selfRate = null,Object? note = null,Object? dateTime = null,}) {
  return _then(_self.copyWith(
emote: null == emote ? _self.emote : emote // ignore: cast_nullable_to_non_nullable
as Emotes,sensations: null == sensations ? _self.sensations : sensations // ignore: cast_nullable_to_non_nullable
as Sensations,stress: null == stress ? _self.stress : stress // ignore: cast_nullable_to_non_nullable
as double,selfRate: null == selfRate ? _self.selfRate : selfRate // ignore: cast_nullable_to_non_nullable
as double,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Mood].
extension MoodPatterns on Mood {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Mood value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Mood() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Mood value)  $default,){
final _that = this;
switch (_that) {
case _Mood():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Mood value)?  $default,){
final _that = this;
switch (_that) {
case _Mood() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Emotes emote,  Sensations sensations,  double stress,  double selfRate,  String note,  DateTime dateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Mood() when $default != null:
return $default(_that.emote,_that.sensations,_that.stress,_that.selfRate,_that.note,_that.dateTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Emotes emote,  Sensations sensations,  double stress,  double selfRate,  String note,  DateTime dateTime)  $default,) {final _that = this;
switch (_that) {
case _Mood():
return $default(_that.emote,_that.sensations,_that.stress,_that.selfRate,_that.note,_that.dateTime);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Emotes emote,  Sensations sensations,  double stress,  double selfRate,  String note,  DateTime dateTime)?  $default,) {final _that = this;
switch (_that) {
case _Mood() when $default != null:
return $default(_that.emote,_that.sensations,_that.stress,_that.selfRate,_that.note,_that.dateTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Mood implements Mood {
  const _Mood({required this.emote, required this.sensations, required this.stress, required this.selfRate, required this.note, required this.dateTime});
  factory _Mood.fromJson(Map<String, dynamic> json) => _$MoodFromJson(json);

@override final  Emotes emote;
@override final  Sensations sensations;
@override final  double stress;
@override final  double selfRate;
@override final  String note;
@override final  DateTime dateTime;

/// Create a copy of Mood
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoodCopyWith<_Mood> get copyWith => __$MoodCopyWithImpl<_Mood>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Mood&&(identical(other.emote, emote) || other.emote == emote)&&(identical(other.sensations, sensations) || other.sensations == sensations)&&(identical(other.stress, stress) || other.stress == stress)&&(identical(other.selfRate, selfRate) || other.selfRate == selfRate)&&(identical(other.note, note) || other.note == note)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,emote,sensations,stress,selfRate,note,dateTime);

@override
String toString() {
  return 'Mood(emote: $emote, sensations: $sensations, stress: $stress, selfRate: $selfRate, note: $note, dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class _$MoodCopyWith<$Res> implements $MoodCopyWith<$Res> {
  factory _$MoodCopyWith(_Mood value, $Res Function(_Mood) _then) = __$MoodCopyWithImpl;
@override @useResult
$Res call({
 Emotes emote, Sensations sensations, double stress, double selfRate, String note, DateTime dateTime
});




}
/// @nodoc
class __$MoodCopyWithImpl<$Res>
    implements _$MoodCopyWith<$Res> {
  __$MoodCopyWithImpl(this._self, this._then);

  final _Mood _self;
  final $Res Function(_Mood) _then;

/// Create a copy of Mood
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emote = null,Object? sensations = null,Object? stress = null,Object? selfRate = null,Object? note = null,Object? dateTime = null,}) {
  return _then(_Mood(
emote: null == emote ? _self.emote : emote // ignore: cast_nullable_to_non_nullable
as Emotes,sensations: null == sensations ? _self.sensations : sensations // ignore: cast_nullable_to_non_nullable
as Sensations,stress: null == stress ? _self.stress : stress // ignore: cast_nullable_to_non_nullable
as double,selfRate: null == selfRate ? _self.selfRate : selfRate // ignore: cast_nullable_to_non_nullable
as double,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
