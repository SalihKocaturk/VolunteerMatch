import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class LoginSocialDivider extends StatelessWidget {
  final String text;
  const LoginSocialDivider({super.key, this.text = 'veya'});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: Colors.grey.withOpacity(.35), height: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.forest.withOpacity(.8),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: Colors.grey.withOpacity(.35), height: 1),
        ),
      ],
    );
  }
}
