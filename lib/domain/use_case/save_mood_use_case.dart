import 'package:get_it/get_it.dart';
import 'package:mood_diary_evo_test/domain/entity/mood.dart';
import 'package:mood_diary_evo_test/domain/repository/mood_repository.dart';

class SaveMoodUseCase {

  final MoodRepository _repository;

  SaveMoodUseCase({MoodRepository? repository}):
    _repository = repository ?? GetIt.I.get();

  Future<void> call(Mood mood) {
    return _repository.sendMood(mood);
  }
}