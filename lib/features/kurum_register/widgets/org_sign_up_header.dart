import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class OrgSignUpHeader extends StatelessWidget {
  const OrgSignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          'Gönüllü kurum hesabı oluşturun',
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w800,
            fontSize: 22,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Kurumunuz adına etkinlik açmak ve gönüllülerle\n'
          'eşleşmek için birkaç bilgiyi doldurmanız yeterli.',
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
