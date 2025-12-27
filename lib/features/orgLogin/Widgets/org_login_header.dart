import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class OrgLoginHeader extends StatelessWidget {
  const OrgLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profil ikonu
        Container(
          width: 82,
          height: 82,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.seed.withOpacity(.10),
            border: Border.all(
              color: AppColors.seed.withOpacity(.35),
              width: 1,
            ),
          ),
          child: Icon(
            Icons.business_rounded,
            color: AppColors.forest,
            size: 40,
          ),
        ),
        const SizedBox(height: 14),

        Text(
          'Hoş geldiniz',
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 6),

        Text(
          'Kurum hesabınıza giriş yapın',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.forest.withOpacity(.85),
            fontWeight: FontWeight.w600,
            fontSize: 13,
            height: 1.35,
          ),
        ),
      ],
    );
  }
}
