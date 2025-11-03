import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

import '../widgets/section_card.dart';

class ActivityItem {
  final String title;
  final String dateText; // ör: "12 Ekim 2025"
  final int xp; // ör: 20

  const ActivityItem({
    required this.title,
    required this.dateText,
    required this.xp,
  });
}

class RecentActivitiesSection extends StatelessWidget {
  const RecentActivitiesSection({
    super.key,
    required this.items,
    this.onItemTap, // opsiyonel: kart tıklandığında detay sayfasına gidebilirsin
  });

  final List<ActivityItem> items;
  final void Function(ActivityItem item)? onItemTap;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Son Etkinlikler',
      children: items.isEmpty
          ? [_EmptyState()]
          : items.map((e) => _ActivityTile(item: e, onTap: onItemTap)).toList(),
    );
  }
}

class _ActivityTile extends StatelessWidget {
  const _ActivityTile({required this.item, this.onTap});
  final ActivityItem item;
  final void Function(ActivityItem item)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: AppColors.seed,
        child: Text(
          item.xp.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      title: Text(
        item.title,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      subtitle: Text(item.dateText),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: onTap == null ? null : () => onTap!(item),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.beige,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.darkBg.withOpacity(.08)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.event_busy_rounded,
            color: AppColors.darkBg.withOpacity(.6),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Henüz etkinlik geçmişi yok.',
              style: TextStyle(
                color: AppColors.darkBg.withOpacity(.8),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
