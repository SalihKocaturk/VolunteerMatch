import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/participant.dart';
import '../models/participant_state.dart';

class ParticipantNotifier extends Notifier<ParticipantState> {
  @override
  ParticipantState build() {
    return ParticipantState(
      search: "",
      originalList: [
        Participant(
          name: "Talya Kuvvet",
          checked: false,
          photo: "https://randomuser.me/api/portraits/women/65.jpg",
        ),
        Participant(
          name: "Mert Özkan",
          checked: true,
          photo: "https://randomuser.me/api/portraits/men/31.jpg",
        ),
        Participant(
          name: "Elif Arslan",
          checked: false,
          photo: "https://randomuser.me/api/portraits/women/33.jpg",
        ),
        Participant(
          name: "Ahmet Kaya",
          checked: false,
          photo: "https://randomuser.me/api/portraits/men/90.jpg",
        ),
      ],
    );
  }

  void setSearch(String value) {
    state = state.copyWith(search: value);
  }

  void toggleCheck(Participant p, bool value) {
    final updated = state.originalList.map((e) {
      if (e.name == p.name) return e.copyWith(checked: value);
      return e;
    }).toList();

    state = state.copyWith(originalList: updated);
  }

  void checkAllFiltered() {
    final filteredNames = state.filtered.map((e) => e.name).toSet();

    final updated = state.originalList.map((p) {
      if (filteredNames.contains(p.name)) {
        return p.copyWith(checked: true);
      }
      return p;
    }).toList();

    state = state.copyWith(originalList: updated);
  }

  void uncheckAllFiltered() {
    final filteredNames = state.filtered.map((e) => e.name).toSet();

    final updated = state.originalList.map((p) {
      if (filteredNames.contains(p.name)) {
        return p.copyWith(checked: false);
      }
      return p;
    }).toList();

    state = state.copyWith(originalList: updated);
  }
}
