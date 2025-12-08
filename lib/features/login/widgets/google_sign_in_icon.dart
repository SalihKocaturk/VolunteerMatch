import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class GoogleSignInIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const GoogleSignInIcon({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
            border: Border.all(color: Colors.grey.withOpacity(.6), width: 1),
          ),
          child: Center(
            child: Image.asset(
              'assets/illustrations/google_logo.png', // senin eklediğin logo
              width: 26,
              height: 26,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
