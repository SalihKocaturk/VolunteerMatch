class QuizState {
  final int currentPage;
  final Map<int, bool> answers;

  const QuizState({this.currentPage = 0, this.answers = const {}});

  QuizState copyWith({int? currentPage, Map<int, bool>? answers}) {
    return QuizState(
      currentPage: currentPage ?? this.currentPage,
      answers: answers ?? this.answers,
    );
  }
}
