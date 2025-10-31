import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class FormFieldReadonly extends StatelessWidget {
  const FormFieldReadonly({
    super.key,
    required this.label,
    required this.value,
    this.keyboardType,
    this.maxLines = 1,
    this.icon,
  });

  final String label;
  final String value;
  final TextInputType? keyboardType;
  final int maxLines;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: value),
      readOnly: true,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: TextStyle(color: AppColors.darkBg, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        prefixIcon: icon == null ? null : Icon(icon, color: AppColors.darkBg),
        labelText: label,
        labelStyle: TextStyle(color: AppColors.darkBg.withOpacity(.70)),
        filled: true,
        fillColor: AppColors.beige,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.darkBg.withOpacity(.12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.green, width: 1.6),
        ),
      ),
    );
  }
}
