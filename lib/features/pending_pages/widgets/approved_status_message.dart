import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class ApprovedStatusMessage extends StatelessWidget {
  final double titleSize;
  final double textSize;

  const ApprovedStatusMessage({
    super.key,
    this.titleSize = 18,
    this.textSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Başvurunuz onaylandı',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w800,
            fontSize: titleSize,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Kurum hesabınız başarıyla onaylandı.\n'
          'Artık etkinlik oluşturabilir ve gönüllülerle\n'
          'uygulama üzerinden buluşabilirsiniz.',
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
