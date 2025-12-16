import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class EventInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget? trailing;

  const EventInfoRow({
    super.key,
    required this.icon,
    required this.text,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.forest.withOpacity(0.08),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: AppColors.forest),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: AppColors.textMuted),
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}
