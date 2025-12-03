import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class QuizQuestionCard extends StatelessWidget {
  final int questionIndex;
  final int totalQuestions;
  final String questionText;
  final bool? selectedAnswer;
  final ValueChanged<bool> onAnswer;

  const QuizQuestionCard({
    super.key,
    required this.questionIndex,
    required this.totalQuestions,
    required this.questionText,
    required this.selectedAnswer,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    final int displayNumber = questionIndex + 1;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        key: ValueKey(selectedAnswer),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),

          // ⭐ 1px soft grey border
          border: Border.all(color: Colors.grey.withOpacity(.28), width: 1),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ⭐ Soru numarası kapsülü
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.seed.withOpacity(.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$displayNumber / $totalQuestions',
                style: TextStyle(
                  color: AppColors.forest,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Soru metni
            Text(
              questionText,
              style: TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _AnswerButton(
                    text: 'Evet',
                    isSelected: selectedAnswer == true,
                    color: AppColors.seed,
                    onTap: () => onAnswer(true),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _AnswerButton(
                    text: 'Hayır',
                    isSelected: selectedAnswer == false,
                    color: AppColors.forest,
                    onTap: () => onAnswer(false),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AnswerButton extends StatefulWidget {
  final String text;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const _AnswerButton({
    required this.text,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  State<_AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<_AnswerButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _animate() {
    setState(() => _scale = 1.08);
    Future.delayed(const Duration(milliseconds: 140), () {
      if (mounted) setState(() => _scale = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isSelected = widget.isSelected;

    return GestureDetector(
      onTap: () {
        _animate();
        widget.onTap();
      },
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOutQuad,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? widget.color : AppColors.white,
            borderRadius: BorderRadius.circular(12),

            // ⭐ soft border
            border: Border.all(
              color: isSelected
                  ? widget.color.withOpacity(.5)
                  : Colors.grey.withOpacity(.35),
              width: 1.2,
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: isSelected ? AppColors.white : widget.color,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
