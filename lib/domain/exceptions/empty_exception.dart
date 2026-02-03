import 'package:equatable/equatable.dart';

class EmptyFieldException with EquatableMixin {
  final String field;

  EmptyFieldException({required this.field});

  @override
  List<Object?> get props => [field];
}