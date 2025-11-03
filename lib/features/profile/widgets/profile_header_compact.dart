import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

import '../models/user_level.dart'; // <-- eklendi

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({
    super.key,
    required this.name,
    required this.avatarUrl,
    required this.userLevel, // <-- levelProgress yerine
  });

  final String name;
  final String avatarUrl;
  final UserLevel userLevel; // <-- değişti

  @override
  Widget build(BuildContext context) {
    final int level = userLevel.level;
    final double progress = userLevel.progress.clamp(0.0, 1.0);
    final int percent = (progress * 100).round();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // foto + isim
          Row(
            children: [
              Container(
                width: 84,
                height: 84,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.seed, width: 3),
                ),
                child: ClipOval(
                  child: Image.network(avatarUrl, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.darkBg,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // seviye + yüzde chip
          Row(
            children: [
              Text(
                'Seviye $level',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBg,
                ),
              ),
              const Spacer(),
              _PercentChip(percent: percent),
            ],
          ),
          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const LinearProgressIndicator(
                minHeight: 16,
                value: 0.8,
                backgroundColor: Color.fromARGB(255, 235, 207, 207),
                color: AppColors.pink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PercentChip extends StatelessWidget {
  const _PercentChip({required this.percent});
  final int percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.beige,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.darkBg.withOpacity(.08)),
      ),
      child: Text(
        '%$percent tamamlandı',
        style: TextStyle(color: AppColors.darkBg, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _ThickProgressBar extends StatelessWidget {
  const _ThickProgressBar({required this.value});
  final double value;

  @override
  Widget build(BuildContext context) {
    final double v = value.clamp(0.0, 1.0).toDouble();
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          // arka plan
          Container(height: 16, color: AppColors.darkBg.withOpacity(0.10)),
          // dolu kısım
          Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: v,
              child: Container(
                height: 16,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.text.withOpacity(0.9),
                      AppColors.seed.withOpacity(0.9),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
