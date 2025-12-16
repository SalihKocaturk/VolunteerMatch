import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prologue/core/constants/app_colors.dart';
import 'package:prologue/core/widgets/corperation/navigationbar/corp_custom_nav_bar.dart';
import 'package:prologue/features/event/corperation/pages/corp_event_page.dart';
import 'package:prologue/features/users/pages/users_hub_page.dart';

import '../providers/bottom_nav_provider.dart';

class CorpBasePage extends ConsumerWidget {
  const CorpBasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(corpBottomNavProvider);

    // Her sekme için sayfalar
    final pages = const [CorpEventPage(), UsersHubPage()];

    return Scaffold(
      backgroundColor: AppColors.beige,
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: CorpCustomNavBar(
        currentIndex: currentIndex,
        onTap: (i) => ref.read(corpBottomNavProvider.notifier).state = i,
      ),
    );
  }
}
