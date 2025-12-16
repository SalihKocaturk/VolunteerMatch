import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/participant_state.dart';
import '../notifiers/participant_notifier.dart';

final participantProvider =
    NotifierProvider<ParticipantNotifier, ParticipantState>(
      () => ParticipantNotifier(),
    );
