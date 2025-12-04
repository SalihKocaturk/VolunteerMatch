import '../../auth/enums/personality_trait.dart';

class QuizQuestion {
  final String text;
  final PersonalityTrait trait;
  final int weight;

  const QuizQuestion({
    required this.text,
    required this.trait,
    this.weight = 1,
  });
}
