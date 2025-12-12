import 'package:flutter/material.dart';

class ApprovedStatusIcon extends StatelessWidget {
  final double size;

  const ApprovedStatusIcon({super.key, this.size = 110});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/illustrations/approved_icon.png', // Senin kaydettiğin görsel
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
