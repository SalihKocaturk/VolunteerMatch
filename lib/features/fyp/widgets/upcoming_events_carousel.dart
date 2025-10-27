import 'package:flutter/material.dart';

import '../../../../../data/demo_data.dart';
import 'event_card.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key, required this.events, this.onTap});

  final List<DemoEvent> events;
  final void Function(DemoEvent event)? onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          for (final event in events) ...[
            EventCard(event: event, onTap: onTap),
            const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}
