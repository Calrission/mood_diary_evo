import 'package:mood_diary_evo_test/domain/enum/sensations.dart';

enum Emotes {
  happy("Радость", [
    Sensations.agitation,
    Sensations.delight,
    Sensations.playfulness,
    Sensations.enjoyment,
    Sensations.charm,
    Sensations.mindfulness,
    Sensations.courage,
    Sensations.pleasure,
    Sensations.sensuality,
    Sensations.energetic,
    Sensations.extravagance,
  ]),

  fear("Страх", [
    Sensations.agitation,
    Sensations.mindfulness,
  ]),

  rabies("Бешенство", [
    Sensations.agitation,
    Sensations.courage,
    Sensations.energetic,
  ]),

  sadness("Грусть", [
    Sensations.mindfulness,
    Sensations.playfulness,
  ]),

  peace("Спокойствие", [
    Sensations.enjoyment,
    Sensations.mindfulness,
    Sensations.pleasure,
    Sensations.sensuality,
  ]),

  strength("Сила", [
    Sensations.courage,
    Sensations.energetic,
    Sensations.playfulness,
  ]);

  final String name;
  final List<Sensations> sensations;

  const Emotes(this.name, this.sensations);
}