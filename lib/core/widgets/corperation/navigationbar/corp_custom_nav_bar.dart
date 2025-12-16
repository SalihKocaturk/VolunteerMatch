import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class CorpCustomNavBar extends StatelessWidget {
  const CorpCustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.seed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.local_activity_sharp),
          label: 'Etkinlikler',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_add_alt_1_outlined),
          label: 'Kişiler',
        ),
      ],
    );
  }
}
