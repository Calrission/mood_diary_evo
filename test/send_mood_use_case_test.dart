import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mood_diary_evo_test/domain/entity/mood.dart';
import 'package:mood_diary_evo_test/domain/enum/emotes.dart';
import 'package:mood_diary_evo_test/domain/enum/sensations.dart';
import 'package:mood_diary_evo_test/domain/repository/mood_repository.dart';
import 'package:mood_diary_evo_test/domain/use_case/send_mood_use_case.dart';

void main(){
  final repository = MockMoodRepository();
  final useCase = SendMoodUseCase(repository: repository);

  test("success mood send", () async {
    final mood = Mood(
      dateTime: DateTime(2026, 02, 03, 00, 00, 00),
      emote: Emotes.happy,
      sensations: Sensations.sensuality,
      stress: 0.5,
      selfRate: 0.5,
      note: "TEST"
    );
    when(() => repository.sendMood(mood)).thenAnswer((_) async {});
    await useCase.call(mood);
    verify(() => repository.sendMood(mood)).called(1);
  });
}