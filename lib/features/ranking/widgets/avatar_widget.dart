// Not: name ve size parametreleriyle kullanacağız; imagePath null ise baş harfler.
import 'dart:math';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String? imagePath;
  final String name;
  final double size;
  final Color? avatarColor;

  const AvatarWidget({
    super.key,
    this.imagePath,
    required this.name,
    this.size = 48,
    this.avatarColor,
  });

  Color _generateBaseColor() {
    final random = Random();
    final hue = random.nextDouble() * 360;
    const saturation = 0.45;
    const value = 0.85;
    return HSVColor.fromAHSV(1, hue, saturation, value).toColor();
  }

  Color _lighten(Color color, [double amount = 0.3]) {
    final hsl = HSLColor.fromColor(color);
    final adjusted = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return adjusted.toColor();
  }

  Color _darken(Color color, [double amount = 0.25]) {
    final hsl = HSLColor.fromColor(color);
    final adjusted = hsl.withLightness(
      (hsl.lightness - amount).clamp(0.0, 1.0),
    );
    return adjusted.toColor();
  }

  @override
  Widget build(BuildContext context) {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .toList();

    String initials;
    if (parts.isEmpty) {
      initials = "?";
    } else if (parts.length == 1) {
      initials = parts.first[0].toUpperCase();
    } else {
      initials = parts.take(2).map((e) => e[0].toUpperCase()).join();
    }

    final isTwoLetters = initials.length > 1;
    final fontSize = isTwoLetters ? size * 0.3 : size * 0.4;

    final baseColor = avatarColor ?? _generateBaseColor();
    final bgColor = _lighten(baseColor, 0.3);
    final textColor = _darken(baseColor, 0.3);

    if (imagePath == null || imagePath!.isEmpty) {
      return CircleAvatar(
        radius: size / 2,
        backgroundColor: bgColor,
        child: Text(
          initials,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: Image.asset(
        imagePath!,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
