import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_card.dart';

class WeeklySuggestions extends StatelessWidget {
  const WeeklySuggestions({super.key, required this.onRefresh});
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.clean_hands, 'label': 'Temizlik Etkinliği'},
      {'icon': Icons.volunteer_activism, 'label': 'Bağış Toplama'},
      {'icon': Icons.local_florist, 'label': 'Fidan Dikimi'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: CustomCard(
        backgroundColor: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bu Haftanın Etkinlikleri',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items
                  .map(
                    (i) => Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.seed.withOpacity(0.15),
                          child: Icon(
                            i['icon'] as IconData,
                            color: AppColors.seed,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          i['label'] as String,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.text,
                          ),
                        ),
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: onRefresh,
                            label: const Text('Yenile'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.seed,
                              foregroundColor: AppColors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
