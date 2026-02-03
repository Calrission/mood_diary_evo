part of 'home_datetime_cubit.dart';

final class HomeDateTimeState with EquatableMixin {
  final DateTime dateTime;
  final bool isEnableUpdating;

  HomeDateTimeState({
    DateTime? dateTime,
    this.isEnableUpdating = true
  }): dateTime = dateTime ?? DateTime.now();

  String get display => (isEnableUpdating)
    ? dateTime.ddMMMMHHmm()
    : dateTime.ddMMMM();

  @override
  List<Object?> get props => [dateTime, isEnableUpdating];
}