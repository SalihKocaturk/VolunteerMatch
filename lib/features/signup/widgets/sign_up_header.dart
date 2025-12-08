import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),

        // Ana başlık
        Text(
          'Gönüllü hesabı oluşturun',
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w800,
            fontSize: 22,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 6),

        // Açıklama
        Text(
          'Birkaç adımda profilinizi oluşturup, size uygun\n'
          'gönüllülük fırsatlarıyla eşleşmeye başlayalım.',
          style: TextStyle(
            color: AppColors.forest.withOpacity(.85),
            fontWeight: FontWeight.w500,
            fontSize: 13,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
