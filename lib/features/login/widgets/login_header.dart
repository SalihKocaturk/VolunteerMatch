import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profil ikonu
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.seed.withOpacity(.12),
            border: Border.all(
              color: AppColors.seed.withOpacity(.35),
              width: 1.5,
            ),
          ),
          child: Icon(Icons.person_rounded, size: 40, color: AppColors.forest),
        ),
        const SizedBox(height: 16),

        Text(
          'Hoş geldiniz',
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Gönüllü hesabınıza giriş yapın',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.forest.withOpacity(.9),
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
