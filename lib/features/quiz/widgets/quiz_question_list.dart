import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/quiz_provider.dart';
import 'quiz_question_card.dart';

class QuizQuestionList extends ConsumerWidget {
  const QuizQuestionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizProvider);
    final notifier = ref.read(quizProvider.notifier);
    final totalQuestions = notifier.questions.length;

    final page = state.currentPage;
    final start = page * 5;
    final questions = notifier.questionsForCurrentPage;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, anim) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.1, 0),
            end: Offset.zero,
          ).animate(anim),
          child: FadeTransition(opacity: anim, child: child),
        );
      },
      child: ListView.builder(
        key: ValueKey(page),
        physics: const BouncingScrollPhysics(),
        itemCount: questions.length,
        itemBuilder: (context, i) {
          final qIndex = start + i;

          return QuizQuestionCard(
            questionIndex: qIndex,
            totalQuestions: totalQuestions,
            questionText: questions[i].text,
            selectedAnswer: state.answers[qIndex],
            onAnswer: (val) => notifier.answerQuestion(qIndex, val),
          );
        },
      ),
    );
  }
}
