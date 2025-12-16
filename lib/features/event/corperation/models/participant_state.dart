import 'participant.dart';

class ParticipantState {
  final List<Participant> originalList;
  final String search;

  ParticipantState({required this.originalList, required this.search});

  List<Participant> get filtered {
    if (search.isEmpty) return originalList;
    return originalList
        .where((p) => p.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  ParticipantState copyWith({List<Participant>? originalList, String? search}) {
    return ParticipantState(
      originalList: originalList ?? this.originalList,
      search: search ?? this.search,
    );
  }
}
