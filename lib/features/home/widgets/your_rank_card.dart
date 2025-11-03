import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

import '../models/user_model.dart';
import 'avatar_widget.dart';

class YourRankCard extends StatelessWidget {
  final UserModel user;
  final int rank;
  final int toNext;

  const YourRankCard({
    super.key,
    required this.user,
    required this.rank,
    required this.toNext,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = (user.score % 1000) / 1000.0;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.seed.withOpacity(.12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.forest.withOpacity(.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          AvatarWidget(name: user.name, imagePath: user.imagePath, size: 44),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: 6),
                // animasyonlu seviye ilerlemesi
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.seed.withOpacity(.10),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: progress),
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOutCubic,
                    builder: (_, v, __) => FractionallySizedBox(
                      widthFactor: v,
                      alignment: Alignment.centerLeft,
                      child: Container(color: AppColors.seed),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.seed.withOpacity(.12),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.seed.withOpacity(.2)),
                ),
                child: Text(
                  '#$rank',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: AppColors.forest,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Seviye ${user.level}',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.text,
                ),
              ),
              Text(
                '+$toNext sonra seviye atlayacaksın',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.forest.withOpacity(.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
