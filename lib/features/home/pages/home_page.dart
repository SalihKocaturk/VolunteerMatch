import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

import '../widgets/home_action_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'volmatch',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Welcome, Salih!', style: TextStyle(fontSize: 44)),
            const SizedBox(height: 16),
            SizedBox(
              height: 140,
              width: double.infinity,
              child: HomeActionCard(
                title: 'Discover\nVolunteering',
                imageAsset: 'assets/illustrations/man_thinkin.png',
                backgroundColor: const Color(0xFFBFE5FF),
                isLeft: true,
                onTap: () {},
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 120,
                    child: HomeActionCard(
                      title: 'Volunteer\nPortal',
                      imageAsset: 'assets/illustrations/man_computer.png',
                      backgroundColor: const Color(0xFFFFD2D8),
                      isLeft: false,
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    height: 120,
                    child: HomeActionCard(
                      title: 'Make an\nEvent',
                      imageAsset: 'assets/illustrations/woman_action.png',
                      backgroundColor: const Color(0xFFF6E3FF),
                      isLeft: false,
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
