import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class ParticipantItem extends StatelessWidget {
  final String name;
  final String photoUrl;
  final bool checked;
  final ValueChanged<bool> onToggle;

  const ParticipantItem({
    super.key,
    required this.name,
    required this.photoUrl,
    required this.checked,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.forest.withOpacity(0.25),
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 22, backgroundImage: NetworkImage(photoUrl)),
          const SizedBox(width: 12),

          // Name
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
            ),
          ),

          // Check switch
          Switch(
            value: checked,
            activeColor: AppColors.forest,
            onChanged: onToggle,
          ),
        ],
      ),
    );
  }
}
