import 'package:equatable/equatable.dart';

class NotFilledFieldException with EquatableMixin {
  final String field;

  NotFilledFieldException({required this.field});

  @override
  List<Object?> get props => [field];
}