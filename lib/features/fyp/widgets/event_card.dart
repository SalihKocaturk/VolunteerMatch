// event_card.dart
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

import '../../../core/widgets/custom_card.dart';
import '../../../data/demo_data.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event, this.onTap});

  final DemoEvent event;
  final void Function(DemoEvent event)? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () => onTap?.call(event),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.seed.withOpacity(.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(event.icon, color: AppColors.seed),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.text,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${event.location} • ${event.date}',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: AppColors.text, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
