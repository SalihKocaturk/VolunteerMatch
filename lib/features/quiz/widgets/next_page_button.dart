import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prologue/core/constants/app_colors.dart';

import '../providers/quiz_provider.dart';

class NextPageButton extends ConsumerWidget {
  const NextPageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizProvider);
    final notifier = ref.read(quizProvider.notifier);

    final isLastPage = state.currentPage == 3;
    final enabled = notifier.pageFullyAnswered(state.currentPage);

    void handleTap() {
      if (!enabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Lütfen tüm soruları cevaplayın.'),
            backgroundColor: AppColors.seed,
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      if (!isLastPage) {
        notifier.nextPage(ref);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Quiz tamamlandı 🎉"),
            backgroundColor: AppColors.seed,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? handleTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled
              ? AppColors.seed
              : Colors.grey.withOpacity(.4),
          disabledBackgroundColor: Colors.grey.withOpacity(.4),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            isLastPage ? 'Bitir' : 'Sonraki Sayfa',
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
