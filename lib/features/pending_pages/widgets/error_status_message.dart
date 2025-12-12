import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class ErrorStatusMessage extends StatelessWidget {
  final double titleSize;
  final double textSize;

  const ErrorStatusMessage({
    super.key,
    this.titleSize = 18,
    this.textSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Başvurunuz reddedildi',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w800,
            fontSize: titleSize,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Kurum başvurunuzu alırken belgelerinizi onaylayamadık.\n'
          'Lütfen bilgilerinizi kontrol edip tekrar deneyin\n'
          'veya daha sonra yeniden deneyin.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.forest.withOpacity(.9),
            fontWeight: FontWeight.w500,
            fontSize: textSize,
            height: 1.45,
          ),
        ),
      ],
    );
  }
}
