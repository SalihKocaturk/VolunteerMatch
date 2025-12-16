import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class UserMiniCard extends StatelessWidget {
  final String name;
  final String photoUrl;
  final VoidCallback onTap;

  const UserMiniCard({
    super.key,
    required this.name,
    required this.photoUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // ---------- Avatar Container ----------
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.forest.withOpacity(0.35),
                width: 2,
              ),
            ),
            child: ClipOval(child: Image.network(photoUrl, fit: BoxFit.cover)),
          ),

          const SizedBox(height: 8),

          // ---------- İsim ----------
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),

          const SizedBox(height: 6),

          // ---------- Küçük CTA Butonu ----------
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.forest.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Detay",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.forest,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
