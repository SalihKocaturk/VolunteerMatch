import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class EventStatusBadge extends StatelessWidget {
  final String status;

  const EventStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final isActive = status == "Aktif";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.green.withOpacity(0.22)
            : AppColors.blue.withOpacity(0.22),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: isActive ? AppColors.green : AppColors.blue,
        ),
      ),
    );
  }
}
