import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prologue/core/constants/app_colors.dart';
import 'package:prologue/core/widgets/custom_text_field.dart';
import 'package:prologue/core/widgets/individual/appbar/custom_app_bar.dart';

import '../providers/user_list_provider.dart';
import '../user_filter.dart';
import '../widgets/user_list_item.dart';

class UserListPage extends ConsumerWidget {
  final UserFilter filter;

  const UserListPage({super.key, this.filter = UserFilter.all});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(userListProvider.notifier);
    final state = ref.watch(userListProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier.setFilter(filter);
    });
    final users = notifier.filtered;

    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: const CustomAppBar(title: "Kullanıcılar", showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------ Search ------------------
            CustomTextField(
              label: "Kullanıcı Ara",
              hint: "İsim yaz...",
              isSearch: true,
              onChanged: (v) => notifier.setSearch(v),
            ),
            const SizedBox(height: 20),

            // ------------------ List ------------------
            for (final u in users)
              UserListItem(
                user: u,
                onTap: () {
                  Navigator.pushNamed(context, "/user/detail", arguments: u);
                },
              ),
          ],
        ),
      ),
    );
  }
}
