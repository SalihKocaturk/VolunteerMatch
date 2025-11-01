import 'package:flutter/material.dart';
import 'package:prologue/features/event/models/event.dart';

import 'event_card.dart';

class ActivityListWidget extends StatelessWidget {
  final List<Event> events;
  final void Function(Event) onApply;

  const ActivityListWidget({
    super.key,
    required this.events,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final activity = events[index];
        return EventCard(event: activity, onJoin: () => onApply(activity));
      },
    );
  }
}
