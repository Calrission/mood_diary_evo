import 'package:equatable/equatable.dart';

import 'mood_exception.dart';

class WrongOrderException extends MoodException with EquatableMixin {
  final String message;

  WrongOrderException(this.message);

  @override
  List<Object?> get props => [message];
}