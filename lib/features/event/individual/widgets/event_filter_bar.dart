import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../providers/event_filter_provider.dart';

class EventFilterBar extends ConsumerWidget {
  const EventFilterBar({super.key});

  String _label(EventFilterType type) {
    switch (type) {
      case EventFilterType.notJoined:
        return 'Başvurulmamış';
      case EventFilterType.pending:
        return 'Beklemede';
      case EventFilterType.joined:
        return 'Onaylanmış';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(eventFilterProvider);
    final types = EventFilterType.values;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFFDF6EE),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.forest.withOpacity(0.25),
            width: 1,
          ),
        ),
        child: Row(
          children: types.map((type) {
            final isSelected = selected == type;
            return Expanded(
              child: GestureDetector(
                onTap: () =>
                    ref.read(eventFilterProvider.notifier).setFilter(type),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.forest.withOpacity(0.9)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _label(type),
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.text,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
