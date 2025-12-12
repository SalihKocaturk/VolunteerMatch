import 'package:flutter/material.dart';

class ErrorStatusIcon extends StatelessWidget {
  final double size;

  const ErrorStatusIcon({super.key, this.size = 110});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/illustrations/error_icon2.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
