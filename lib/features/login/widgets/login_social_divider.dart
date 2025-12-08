import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class LoginSocialDivider extends StatelessWidget {
  const LoginSocialDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(height: 1, color: Colors.grey.withOpacity(.35)),
        ),
        const SizedBox(width: 8),
        Text(
          'veya',
          style: TextStyle(
            color: AppColors.forest.withOpacity(.9),
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(height: 1, color: Colors.grey.withOpacity(.35)),
        ),
      ],
    );
  }
}
