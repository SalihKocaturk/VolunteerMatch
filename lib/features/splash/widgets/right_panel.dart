import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

import 'feature_tile.dart';

class RightPanel extends StatelessWidget {
  const RightPanel({super.key});

  // Ana metin rengi

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 8),
        Text(
          'Neler Sunuyoruz?',
          style: const TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 10),
        const FeatureTile(
          icon: Icons.event_available_rounded,
          title: 'Etkinlikleri Keşfet',
          subtitle:
              'Yakınındaki etkinlikleri filtrele, başvur, takvimine ekle.',
        ),
        const FeatureTile(
          icon: Icons.emoji_events_rounded,
          title: 'Rozet & Puan',
          subtitle: 'Katıldıkça rozet kazan, profilini güçlendir.',
        ),
        const FeatureTile(
          icon: Icons.chat_bubble_rounded,
          title: 'Mesajlaşma',
          subtitle: 'Kurumlarla güvenli şekilde iletişime geç.',
        ),
      ],
    );
  }
}
