import 'package:mood_diary_evo_test/domain/entity/mood.dart';
import 'package:mood_diary_evo_test/domain/repository/mood_repository.dart';

class MoodRepositoryImpl implements MoodRepository {

  // final Dio _dio;
  //
  // MoodRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<void> sendMood(Mood mood) {
    // Тут была бы логика обращения к серверу
    return Future.delayed(Duration(milliseconds: 500));
  }
}