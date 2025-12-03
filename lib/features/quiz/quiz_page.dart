import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import 'widgets/quiz_progress_bar.dart';
import 'widgets/quiz_question_card.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<String> _questions = [
    'Takım çalışmasından hoşlanırım.',
    'Yeni insanlarla tanışmak beni motive eder.',
    'Zamanımı planlamakta zorlanırım.',
    'Yardım etmeyi içten bir şekilde severim.',
    'Zor durumda sakin kalabilirim.',
    'Yeni ortamlara kolay adapte olurum.',
    'Karar verirken duygularımı ön planda tutarım.',
    'Grup içi iletişimde liderliği üstlenirim.',
    'Yardım istemekten çekinirim.',
    'Detaylara çok dikkat ederim.',
    'Stresli durumlarda hızlı düşünürüm.',
    'Başkalarının fikirlerine saygı duyarım.',
    'Hedef belirleyip buna ulaşmak için çabalarım.',
    'Eleştirileri yapıcı şekilde iletirim.',
    'Yeni şeyler öğrenmekten keyif alırım.',
    'Toplum yararına projelerde aktif olmak isterim.',
    'Zaman zaman yalnız kalmayı tercih ederim.',
    'Sorun çözmeyi severim.',
    'Yeniliklere karşı açıktayım.',
    'Planlı çalışmayı severim.',
  ];

  int _currentIndex = 0; // 0,1,2,3
  final Map<int, bool> _answers = {};

  void _answerQuestion(int questionIndex, bool answer) {
    setState(() {
      _answers[questionIndex] = answer;
    });
  }

  bool _pageFullyAnswered(int page) {
    final start = page * 5;
    final end = start + 5;

    for (int i = start; i < end; i++) {
      if (!_answers.containsKey(i)) return false;
    }
    return true;
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
    } else {
      Navigator.pop(context);
    }
  }

  void _nextPage() {
    if (!_pageFullyAnswered(_currentIndex)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Lütfen tüm soruları cevaplayın.'),
          backgroundColor: AppColors.seed,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (_currentIndex < 3) {
      setState(() => _currentIndex++);
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

  @override
  Widget build(BuildContext context) {
    final start = _currentIndex * 5;
    final end = start + 5;
    final currentQuestions = _questions.sublist(start, end);

    final isPageComplete = _pageFullyAnswered(_currentIndex);

    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: AppBar(
        backgroundColor: AppColors.beige,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.text),
          onPressed: _previousPage, // GERİ TUŞU DÜZELTİLMİŞ HALİ
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
            // ⭐ Yeni premium progress bar
            QuizProgressBar(currentPage: _currentIndex + 1, totalPages: 4),

            const SizedBox(height: 16),

            // ⭐ Fade + slide animasyonu
            Expanded(
              child: AnimatedSwitcher(
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
                  key: ValueKey(_currentIndex),
                  physics: const BouncingScrollPhysics(),
                  itemCount: currentQuestions.length,
                  itemBuilder: (context, i) {
                    final questionIndex = start + i;

                    return QuizQuestionCard(
                      questionIndex: questionIndex,
                      totalQuestions: _questions.length,
                      questionText: currentQuestions[i],
                      selectedAnswer: _answers[questionIndex],
                      onAnswer: (a) => _answerQuestion(questionIndex, a),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 14),

            // ⭐ Disabled / Active BUTON
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: isPageComplete ? _nextPage : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPageComplete
                      ? AppColors.seed
                      : Colors.grey.withOpacity(.4),
                  disabledBackgroundColor: Colors.grey.withOpacity(.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  _currentIndex < 3 ? 'Sonraki Sayfa' : 'Bitir',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
