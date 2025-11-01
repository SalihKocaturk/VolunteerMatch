// lib/widgets/ranking_list.dart
import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import '../models/user_model.dart';
import 'avatar_widget.dart';

class RankingList extends StatelessWidget {
  final List<UserModel> users; // 4. sıradan itibaren
  final String? highlightUserId;

  const RankingList({super.key, required this.users, this.highlightUserId});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      itemCount: users.length,
      separatorBuilder: (_, __) =>
          Divider(height: 1, color: AppColors.seed.withOpacity(.08)),
      itemBuilder: (context, index) {
        final user = users[index];
        final rank = index + 4; // 1-2-3 podyumda
        final isHighlighted = user.id == highlightUserId;

        return Material(
          color: isHighlighted
              ? AppColors.seed.withOpacity(.06)
              : AppColors.white.withOpacity(0),
          child: InkWell(
            onTap: () {},
            splashColor: AppColors.seed.withOpacity(.10),
            child: ListTile(
              minLeadingWidth: 0,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // sıra rozeti
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.seed.withOpacity(.12),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.seed.withOpacity(.2),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      '$rank',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: AppColors.forest,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  AvatarWidget(
                    name: user.name,
                    imagePath: user.imagePath,
                    size: 42,
                  ),
                ],
              ),
              title: Text(
                user.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: isHighlighted ? FontWeight.w700 : FontWeight.w600,
                  color: AppColors.text,
                  letterSpacing: .1,
                ),
              ),
              // Seviye rozeti
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.seed.withOpacity(.10),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.seed.withOpacity(.20)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.military_tech_rounded,
                      size: 16,
                      color: AppColors.forest,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Lvl ${user.level}',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: AppColors.forest,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
