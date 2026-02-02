import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_mode_state.dart';

class HomeModeCubit extends Cubit<HomeModeState> {
  HomeModeCubit() : super(HomeModeState.journal);

  void toJournal() => emit(HomeModeState.journal);
  void toStatistic() => emit(HomeModeState.statistic);
}
