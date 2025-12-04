import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/quiz_state.dart';
import '../notifiers/quiz_notifier.dart';

final quizProvider = NotifierProvider<QuizNotifier, QuizState>(() {
  return QuizNotifier();
});
