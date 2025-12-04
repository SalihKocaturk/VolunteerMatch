import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/enums/personality_trait.dart';
import '../../auth/models/personality_scores.dart';
import '../../auth/providers/auth_provider.dart';
import '../models/quiz_question.dart';
import '../models/quiz_state.dart';

class QuizNotifier extends Notifier<QuizState> {
  late final List<QuizQuestion> questions;

  @override
  QuizState build() {
    questions = [
      QuizQuestion(
        text: 'Takım çalışmasından hoşlanırım.',
        trait: PersonalityTrait.agreeableness,
      ),
      QuizQuestion(
        text: 'Yardım etmeyi içten bir şekilde severim.',
        trait: PersonalityTrait.agreeableness,
      ),
      QuizQuestion(
        text: 'Başkalarının fikirlerine saygı duyarım.',
        trait: PersonalityTrait.agreeableness,
      ),
      QuizQuestion(
        text: 'Toplum yararına projelerde aktif olmak isterim.',
        trait: PersonalityTrait.agreeableness,
      ),

      // ——— EXTRAVERSION (Dışadönüklük) ———
      QuizQuestion(
        text: 'Yeni insanlarla tanışmak beni motive eder.',
        trait: PersonalityTrait.extraversion,
      ),
      QuizQuestion(
        text: 'Grup içi iletişimde liderliği üstlenirim.',
        trait: PersonalityTrait.extraversion,
      ),
      QuizQuestion(
        text: 'Yeni ortamlara kolay adapte olurum.',
        trait: PersonalityTrait.extraversion,
      ),
      QuizQuestion(
        text: 'Zaman zaman yalnız kalmayı tercih ederim.',
        trait: PersonalityTrait.extraversion,
      ),

      // ——— CONSCIENTIOUSNESS (Sorumluluk / Planlılık) ———
      QuizQuestion(
        text: 'Zamanımı planlamakta zorlanırım.',
        trait: PersonalityTrait.conscientiousness,
      ),
      QuizQuestion(
        text: 'Detaylara çok dikkat ederim.',
        trait: PersonalityTrait.conscientiousness,
      ),
      QuizQuestion(
        text: 'Hedef belirleyip buna ulaşmak için çabalarım.',
        trait: PersonalityTrait.conscientiousness,
      ),
      QuizQuestion(
        text: 'Planlı çalışmayı severim.',
        trait: PersonalityTrait.conscientiousness,
      ),

      // ——— NEUROTICISM (Duygusal Dengesizlik / Stres Yönetimi) ———
      QuizQuestion(
        text: 'Zor durumda sakin kalabilirim.',
        trait: PersonalityTrait.neuroticism,
      ),
      QuizQuestion(
        text: 'Stresli durumlarda hızlı düşünürüm.',
        trait: PersonalityTrait.neuroticism,
      ),
      QuizQuestion(
        text: 'Karar verirken duygularımı ön planda tutarım.',
        trait: PersonalityTrait.neuroticism,
      ),
      QuizQuestion(
        text: 'Yardım istemekten çekinirim.',
        trait: PersonalityTrait.neuroticism,
      ),

      // ——— OPENNESS (Açıklık) ———
      QuizQuestion(
        text: 'Yeni şeyler öğrenmekten keyif alırım.',
        trait: PersonalityTrait.openness,
      ),
      QuizQuestion(
        text: 'Yeniliklere karşı açıktayım.',
        trait: PersonalityTrait.openness,
      ),
      QuizQuestion(
        text: 'Sorun çözmeyi severim.',
        trait: PersonalityTrait.openness,
      ),
      QuizQuestion(
        text: 'Eleştirileri yapıcı şekilde iletirim.',
        trait: PersonalityTrait.openness,
      ),
    ];

    return const QuizState();
  }

  void answerQuestion(int index, bool value) {
    final newAnswers = Map<int, bool>.from(state.answers);
    newAnswers[index] = value;

    state = state.copyWith(answers: newAnswers);
  }

  bool pageFullyAnswered(int page) {
    final start = page * 5;
    final end = start + 5;

    for (int i = start; i < end; i++) {
      if (!state.answers.containsKey(i)) return false;
    }
    return true;
  }

  void nextPage(WidgetRef ref) {
    if (state.currentPage == 3) {
      finalizeQuiz(ref);
    } else {
      state = state.copyWith(currentPage: state.currentPage + 1);
    }
  }

  void previousPage() {
    if (state.currentPage > 0) {
      state = state.copyWith(currentPage: state.currentPage - 1);
    }
  }

  void finalizeQuiz(WidgetRef ref) {
    final scores = calculateScores();
    ref.read(authProvider.notifier).updateScores(scores);
  }

  List<QuizQuestion> get questionsForCurrentPage {
    final start = state.currentPage * 5;
    final end = start + 5;
    return questions.sublist(start, end);
  }

  PersonalityScores calculateScores() {
    int openness = 0;
    int conscientiousness = 0;
    int extraversion = 0;
    int agreeableness = 0;
    int neuroticism = 0;

    state.answers.forEach((index, answerValue) {
      if (!answerValue) return; // false ise puan verme

      final trait = questions[index].trait;

      switch (trait) {
        case PersonalityTrait.openness:
          openness++;
          break;
        case PersonalityTrait.conscientiousness:
          conscientiousness++;
          break;
        case PersonalityTrait.extraversion:
          extraversion++;
          break;
        case PersonalityTrait.agreeableness:
          agreeableness++;
          break;
        case PersonalityTrait.neuroticism:
          neuroticism++;
          break;
      }
    });

    return PersonalityScores(
      openness: openness,
      conscientiousness: conscientiousness,
      extraversion: extraversion,
      agreeableness: agreeableness,
      neuroticism: neuroticism,
    );
  }
}
