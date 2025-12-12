import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class PendingStatusMessage extends StatelessWidget {
  final double titleSize;
  final double textSize;

  const PendingStatusMessage({
    super.key,
    this.titleSize = 18,
    this.textSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Kayıt incelemede',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w800,
            fontSize: titleSize,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Kurum hesabınız ekibimiz tarafından kontrol ediliyor.\n'
          'Onaylandığında size e-posta ile bilgi vereceğiz.',
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
