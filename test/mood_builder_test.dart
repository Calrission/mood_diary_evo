import 'package:flutter_test/flutter_test.dart';
import 'package:mood_diary_evo_test/domain/entity/mood.dart';
import 'package:mood_diary_evo_test/domain/enum/emotes.dart';
import 'package:mood_diary_evo_test/domain/enum/sensations.dart';
import 'package:mood_diary_evo_test/domain/builder/mood_builder.dart';

void main(){
  test("Success build when complete builder", (){
    final builder = MoodBuilder()
      .setDateTime(DateTime(2026, 02, 03, 00, 00, 00))
      .setEmote(Emotes.happy)
      .setSensation(Sensations.sensuality)
      .setStress(0.5)
      .setSelfRate(0.5)
      .setNote("Сегодня я чувствую себя хорошо!");
    
    final Mood mood = builder.build();
    expect(mood, Mood(
      emote: Emotes.happy,
      sensations: Sensations.sensuality,
      stress: 0.5,
      selfRate: 0.5,
      dateTime: DateTime(2026, 02, 03, 00, 00, 00),
      note: "Сегодня я чувствую себя хорошо!",
    ));
  });

  test("Build error when the builder is incomplete", (){
    final builder = MoodBuilder()
      .setEmote(Emotes.happy)
      .setSensation(Sensations.sensuality);
    expect(
      () => builder.build(),
      throwsA(predicate(
        (e) => e == "Stress is not filled"
      ))
    );
  });

  test("True check is completed", (){
    final builder = MoodBuilder()
      .setEmote(Emotes.happy)
      .setSensation(Sensations.sensuality)
      .setStress(0.5)
      .setSelfRate(0.5)
      .setDateTime(DateTime(2026, 02, 03, 00, 00, 00))
      .setNote("Сегодня я чувствую себя хорошо!");
    final isCompleted = builder.isCompleted;
    expect(isCompleted, true);
  });

  test("False check is completed", (){
    final builder = MoodBuilder()
      .setEmote(Emotes.happy)
      .setSensation(Sensations.sensuality)
      .setStress(0.5)
      .setSelfRate(0.5);
    final isCompleted = builder.isCompleted;
    expect(isCompleted, false);
  });

  test("Stress should have a value between 0 and 1", (){
    final builder = MoodBuilder();
    expect(
      () => builder.setStress(1.1),
      throwsA(predicate(
        (e) => e == "Stress should have a value between 0 and 1"
      ))
    );
    expect(
      () => builder.setStress(-0.1),
      throwsA(predicate(
        (e) => e == "Stress should have a value between 0 and 1"
      ))
    );
  });

  test("SelfRate should have a value between 0 and 1", (){
    final builder = MoodBuilder();
    expect(
      () => builder.setSelfRate(1.1),
      throwsA(predicate(
        (e) => e == "SelfRate should have a value between 0 and 1"
      ))
    );
    expect(
      () => builder.setSelfRate(-0.1),
      throwsA(predicate(
        (e) => e == "SelfRate should have a value between 0 and 1"
      ))
    );
  });

  test("Note should have a not empty value", (){
    final builder = MoodBuilder();
    expect(
      () => builder.setNote(""),
      throwsA(predicate(
        (e) => e == "Note should have a not empty value"
      ))
    );
  });
}