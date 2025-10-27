import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

import '../../../core/widgets/custom_card.dart';
import '../../../data/demo_data.dart';

class OrganizationCard extends StatelessWidget {
  const OrganizationCard({super.key, required this.org});
  final DemoOrg org;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderRadius: 16,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.seed.withAlpha(15),
            child: Icon(org.icon, color: AppColors.seed),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 220),
              child: Text(
                org.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.text,
                  fontSize: 14,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
