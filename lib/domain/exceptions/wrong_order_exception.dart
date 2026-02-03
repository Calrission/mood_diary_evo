import 'package:equatable/equatable.dart';

class WrongOrderException with EquatableMixin {
  final String message;

  WrongOrderException(this.message);

  @override
  List<Object?> get props => [message];

}