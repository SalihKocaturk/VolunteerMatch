import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import 'package:prologue/core/widgets/individual/appbar/custom_app_bar.dart';

import '../../../core/navigation/debug_navigate.dart';
import '../pages/user_list_page.dart';
import '../user_filter.dart';
import '../widgets/user_category_card.dart';

class UsersHubPage extends StatelessWidget {
  const UsersHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: const CustomAppBar(title: "Kullanıcılar"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
        child: Column(
          children: [
            // ---------- Tüm Kullanıcılar ----------
            UserCategoryCard(
              title: "Tüm Kullanıcılar",
              users: demoUsers.take(3).toList(),
              onShowAll: () {
                NavHelper.push(
                  context,
                  const UserListPage(filter: UserFilter.all),
                );
              },
            ),
            const SizedBox(height: 10),

            // ---------- Başvuran Kullanıcılar ----------
            UserCategoryCard(
              title: "Başvuran Kullanıcılar",
              users: demoUsersApplicants.take(3).toList(),
              onShowAll: () {
                NavHelper.push(
                  context,
                  const UserListPage(filter: UserFilter.applicants),
                );
              },
            ),
            const SizedBox(height: 10),

            // ---------- Daha Önce Çalışan Kullanıcılar ----------
            UserCategoryCard(
              title: "Daha Önce Çalışanlar",
              users: demoUsersOldWorkers.take(3).toList(),
              onShowAll: () {
                NavHelper.push(
                  context,
                  const UserListPage(filter: UserFilter.oldWorkers),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ------- DEMO USER LISTS ------- //
final demoUsers = [
  {
    "name": "Talya",
    "photo": "https://randomuser.me/api/portraits/women/65.jpg",
  },
  {"name": "Mert", "photo": "https://randomuser.me/api/portraits/men/31.jpg"},
  {"name": "Elif", "photo": "https://randomuser.me/api/portraits/women/33.jpg"},
  {"name": "Ahmet", "photo": "https://randomuser.me/api/portraits/men/90.jpg"},
];

final demoUsersApplicants = demoUsers.reversed.toList();
final demoUsersOldWorkers = demoUsers.sublist(0, 3);
