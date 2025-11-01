import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import '../models/user_model.dart';
import 'avatar_widget.dart';
import 'trophy_cup.dart';

class PodiumTile extends StatelessWidget {
  final int position; // 1,2,3
  final UserModel? user;
  const PodiumTile({super.key, required this.position, required this.user});

  @override
  Widget build(BuildContext context) {
    final bool isFirst = position == 1;
    final double avatarSize = isFirst ? 66 : 56;
    final double barHeight = isFirst ? 44 : (position == 2 ? 36 : 30);

    return Column(
      children: [
        // kupa rozeti
        TrophyCup(size: isFirst ? 30 : 26, filled: isFirst),
        const SizedBox(height: 8),
        // avatar
        AvatarWidget(
          name: user?.name ?? '-',
          imagePath: user?.imagePath,
          size: avatarSize,
        ),
        const SizedBox(height: 8),
        // isim
        Text(
          user?.name ?? '—',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.seed.withOpacity(.95),
          ),
        ),
        const SizedBox(height: 10),
        // podium bar
        Container(
          width: 64,
          height: barHeight,
          decoration: BoxDecoration(
            color: AppColors.seed.withOpacity(.14),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.seed.withOpacity(.20),
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            position.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.seed,
            ),
          ),
        ),
      ],
    );
  }
}
