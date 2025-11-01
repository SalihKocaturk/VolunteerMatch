import 'package:flutter_riverpod/flutter_riverpod.dart';

enum EventFilterType { notJoined, pending, joined }

class EventFilterNotifier extends StateNotifier<EventFilterType> {
  EventFilterNotifier() : super(EventFilterType.notJoined);

  void setFilter(EventFilterType filter) => state = filter;
}

final eventFilterProvider =
    StateNotifierProvider<EventFilterNotifier, EventFilterType>(
      (ref) => EventFilterNotifier(),
    );
