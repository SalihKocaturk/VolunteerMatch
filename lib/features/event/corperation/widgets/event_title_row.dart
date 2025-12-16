import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class EventTitleRow extends StatelessWidget {
  final String title;

  const EventTitleRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.text,
            ),
          ),
        ),
        Row(
          children: const [
            Icon(Icons.edit, size: 16, color: AppColors.forest),
            SizedBox(width: 4),
            Text(
              "Düzenle",
              style: TextStyle(
                color: AppColors.forest,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
