import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prologue/core/constants/app_colors.dart';
import 'package:prologue/features/event/pages/event_page.dart';
import 'package:prologue/features/fyp/pages/fyp_page.dart';
import 'package:prologue/features/home/pages/home_page.dart';
import 'package:prologue/features/profile/pages/profile_page.dart';

import '../../../core/widgets/navigationbar/custom_nav_bar.dart';
import '../providers/bottom_nav_provider.dart';

class BasePage extends ConsumerWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);

    // Her sekme için sayfalar
    final pages = const [HomePage(), FypPage(), EventPage(), ProfilePage()];

    return Scaffold(
      backgroundColor: AppColors.beige,
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: CustomNavBar(
        currentIndex: currentIndex,
        onTap: (i) => ref.read(bottomNavProvider.notifier).state = i,
      ),
    );
  }
}
