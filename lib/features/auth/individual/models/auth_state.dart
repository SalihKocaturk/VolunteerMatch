import 'personality_scores.dart';

class AuthState {
  final String email;
  final String password;
  final PersonalityScores scores;

  const AuthState({
    this.email = "",
    this.password = "",
    this.scores = const PersonalityScores(),
  });

  AuthState copyWith({
    String? email,
    String? password,
    PersonalityScores? scores,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      scores: scores ?? this.scores,
    );
  }
}