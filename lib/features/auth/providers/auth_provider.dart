import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/auth_state.dart';
import '../models/personality_scores.dart';

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return const AuthState();
  }

  void updateScores(PersonalityScores newScores) {
    state = state.copyWith(scores: newScores);
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
