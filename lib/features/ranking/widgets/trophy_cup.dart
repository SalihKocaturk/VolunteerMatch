import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class TrophyCup extends StatelessWidget {
  final double size;
  final bool filled; // doldurulmuş efekti (1. için true)
  const TrophyCup({super.key, this.size = 28, this.filled = false});

  @override
  Widget build(BuildContext context) {
    final Color c = AppColors.seed;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: filled
              ? [c.withOpacity(.95), c.withOpacity(.7)]
              : [c.withOpacity(.12), c.withOpacity(.06)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: c.withOpacity(.18), width: 1),
      ),
      child: Icon(
        Icons.emoji_events_rounded,
        size: size * 0.62,
        color: filled ? AppColors.white : c.withOpacity(.8),
      ),
    );
  }
}
