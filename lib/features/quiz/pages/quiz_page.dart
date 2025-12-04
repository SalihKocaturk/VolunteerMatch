import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prologue/core/constants/app_colors.dart';

import '../providers/quiz_provider.dart';
import '../widgets/next_page_button.dart';
import '../widgets/quiz_progress_bar.dart';
import '../widgets/quiz_question_list.dart';

class QuizPage extends ConsumerWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizProvider);
    final notifier = ref.read(quizProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: AppBar(
        backgroundColor: AppColors.beige,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.text),
          onPressed: notifier.previousPage,
        ),
        title: Text(
          'Gönüllü Tanıma Testi',
          style: TextStyle(color: AppColors.text, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          children: [
            /// Progress bar sadece state'e bakıyor
            QuizProgressBar(currentPage: state.currentPage + 1, totalPages: 4),

            const SizedBox(height: 16),

            /// Soru listesi tamamen provider üzerinden çalışıyor
            const Expanded(child: QuizQuestionList()),

            const SizedBox(height: 14),

            /// NextPageButton da kendi içinden provider'a erişiyor
            const NextPageButton(),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
