import 'package:flutter/material.dart';

class PendingStatusIcon extends StatelessWidget {
  final double size;

  const PendingStatusIcon({super.key, this.size = 110});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/illustrations/pending_icon.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
