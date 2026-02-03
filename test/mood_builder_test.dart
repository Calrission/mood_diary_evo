import 'package:flutter_test/flutter_test.dart';
import 'package:mood_diary_evo_test/domain/entity/mood.dart';
import 'package:mood_diary_evo_test/domain/enum/emotes.dart';
import 'package:mood_diary_evo_test/domain/enum/sensations.dart';
import 'package:mood_diary_evo_test/domain/builder/mood_builder.dart';
import 'package:mood_diary_evo_test/domain/exceptions/not_filled_exception.dart';
import 'package:mood_diary_evo_test/domain/exceptions/wrong_order_exception.dart';

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
        (e) => e == NotFilledFieldException(field: "stress")
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
        (e) => e is RangeError &&
          e.start == 0 &&
          e.end == 1 &&
          e.name == "stress" &&
          e.invalidValue == 1.1
      ))
    );
    expect(
      () => builder.setStress(-0.1),
        throwsA(predicate(
          (e) => e is RangeError &&
          e.start == 0 &&
          e.end == 1 &&
          e.name == "stress" &&
          e.invalidValue == -0.1
        ))
    );
  });

  test("SelfRate should have a value between 0 and 1", (){
    final builder = MoodBuilder();
    expect(
      () => builder.setSelfRate(1.1),
      throwsA(predicate(
        (e) => e is RangeError &&
        e.start == 0 &&
        e.end == 1 &&
        e.name == "selfRate" &&
        e.invalidValue == 1.1
      ))
    );
    expect(
      () => builder.setSelfRate(-0.1),
      throwsA(predicate(
        (e) => e is RangeError &&
        e.start == 0 &&
        e.end == 1 &&
        e.name == "selfRate" &&
        e.invalidValue == -0.1
      ))
    );
  });

  test("When note is empty - it convert to null", (){
    final builder = MoodBuilder().setNote("");
    expect(builder.note, null);
  });

  test("Sensations must be conveyed first than emote", (){
    final builder = MoodBuilder();
    expect(
      () => builder.setSensation(Sensations.charm),
      throwsA(predicate(
        (e) => e == WrongOrderException("Sensations must be conveyed first than emote")
      ))
    );
  });

  test("Sensations must be contains in Emotes.sensations", (){
    final builder = MoodBuilder()
      .setEmote(Emotes.sadness);
    expect(
      () => builder.setSensation(Sensations.charm),
      throwsA(predicate(
        (e) => e == WrongOrderException("Sensations must be contains in Emotes.sensations")
      ))
    );
  });

  test("Sensations is null when set new Emote", (){
    final builder = MoodBuilder()
        .setEmote(Emotes.sadness)
        .setSensation(Sensations.mindfulness)
        .setEmote(Emotes.happy);
    expect(builder.sensation, null);
  });
}