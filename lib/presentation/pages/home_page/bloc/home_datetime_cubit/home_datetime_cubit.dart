import 'package:datetime_loop/datetime_loop.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_diary_evo_test/core/extensions/date_time_extension.dart';

part 'home_datetime_state.dart';

class HomeDateTimeCubit extends Cubit<HomeDateTimeState> {

  final DateTimeLoopController _dateTimeLoopController;

  HomeDateTimeCubit({DateTimeLoopController? dateTimeLoopController}):
    _dateTimeLoopController = dateTimeLoopController ?? GetIt.I.get(),
    super(HomeDateTimeState())
  {
    _dateTimeLoopController.dateTimeStream.listen(_onTimeChanged);
  }

  void _onTimeChanged(DateTime newDateTime){
    if (state.isEnableUpdating){
      emit(HomeDateTimeState(dateTime: newDateTime));
    } else {
      if (newDateTime.onlyDate == state.dateTime.onlyDate){
        emit(HomeDateTimeState(dateTime: newDateTime));
      }
    }
  }

  void setDateTime(DateTime dateTime){
    emit(HomeDateTimeState(dateTime: dateTime, isEnableUpdating: false));
  }
}
