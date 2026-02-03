import 'package:equatable/equatable.dart';
import 'package:mood_diary_evo_test/domain/exceptions/mood_exception.dart';

class NotFilledFieldException extends MoodException with EquatableMixin {
  final String field;

  NotFilledFieldException({required this.field});

  @override
  List<Object?> get props => [field];
}