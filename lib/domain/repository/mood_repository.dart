import 'package:mood_diary_evo_test/domain/entity/mood.dart';
import 'package:mocktail/mocktail.dart';

abstract class MoodRepository {
  Future<void> sendMood(Mood mood);
}

class MockMoodRepository extends Mock implements MoodRepository {}