import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../event/enums/activity_filter_type.dart';
import '../../event/widgets/activity_filter_chip.dart';
import '../provider/activity_filter_provider.dart';

class FypFilterBar extends ConsumerWidget {
  const FypFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilters = ref.watch(activityFilterProvider);

    final filters = {
      ActivityFilterType.announcements: 'Duyurular',
      ActivityFilterType.requests: 'Ödüller',
      ActivityFilterType.events: 'Katkılar',
      ActivityFilterType.unread: 'Doğum Günleri',
      ActivityFilterType.all: 'Hepsi',
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: filters.entries.map((entry) {
            final type = entry.key;
            return ActivityFilterChip(
              label: entry.value,
              isSelected: selectedFilters.contains(type),
              onTap: () =>
                  ref.read(activityFilterProvider.notifier).toggleFilter(type),
            );
          }).toList(),
        ),
      ),
    );
  }
}
