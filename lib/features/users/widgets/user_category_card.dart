import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import 'package:prologue/core/widgets/custom_card.dart';

import 'user_mini_card.dart';

class UserCategoryCard extends StatelessWidget {
  final String title;
  final List<Map<String, String>> users;
  final VoidCallback onShowAll;

  const UserCategoryCard({
    super.key,
    required this.title,
    required this.users,
    required this.onShowAll,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderRadius: 18,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- TITLE ----------
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 14),

          // ---------- MINI USER GRID ----------
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: users.map((u) {
              return Padding(
                padding: const EdgeInsets.only(right: 18),
                child: UserMiniCard(
                  name: u["name"]!,
                  photoUrl: u["photo"]!,
                  onTap: () {},
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 18),

          // ---------- TÜMÜNÜ GÖSTER ----------
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onShowAll,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: AppColors.forest.withOpacity(0.4),
                  width: 1.2,
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Tümünü Göster",
                style: TextStyle(color: AppColors.text, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
