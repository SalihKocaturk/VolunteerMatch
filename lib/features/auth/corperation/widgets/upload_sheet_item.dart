import 'package:flutter/material.dart';

class UploadSheetItem extends StatelessWidget {
  const UploadSheetItem({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      leading: Icon(icon, size: 26, color: color),
      title: Text(
        text,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
    );
  }
}
