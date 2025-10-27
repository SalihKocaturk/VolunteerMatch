import 'package:flutter/material.dart';

class HomeActionCard extends StatelessWidget {
  final String title;
  final String imageAsset;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final bool isLeft;
  const HomeActionCard({
    super.key,
    required this.title,
    required this.imageAsset,
    required this.backgroundColor,
    required this.isLeft,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(18),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: isLeft ? EdgeInsets.all(14) : EdgeInsets.all(8),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.fitWidth,
                  height: 100,
                  width: isLeft ? 150 : 95,
                ),
              ),

              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: isLeft
                      ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                      : TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
