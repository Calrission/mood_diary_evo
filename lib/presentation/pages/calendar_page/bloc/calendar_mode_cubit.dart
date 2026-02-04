import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary_evo_test/presentation/pages/calendar_page/enum/calendar_mode.dart';

class CalendarModeCubit extends Cubit<CalendarMode> {
  CalendarModeCubit() : super(CalendarMode.list);

  void toggleMode() {
    emit(state.next());
  }
}
