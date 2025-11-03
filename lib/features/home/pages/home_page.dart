import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prologue/core/widgets/appbar/custom_app_bar.dart';
import 'package:prologue/features/base/providers/bottom_nav_provider.dart';
import 'package:prologue/features/home/widgets/user_ranking_card.dart';

import '../../../core/constants/app_colors.dart';
import '../data/activities.dart';
import '../data/recommended.dart';
import '../widgets/recommended_events_section.dart';
import '../widgets/your_shifts_section.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  static const route = '/home';

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  static const TextStyle _titleLg = TextStyle(
    color: AppColors.text,
    fontWeight: FontWeight.w800,
    fontSize: 20,
  );

  Future<void> _simulateRefresh() async {
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {}); // gerektiğinde local UI refresh
  }

  @override
  Widget build(BuildContext context) {
    // burada ref.watch(...) ile provider’ları dinleyebilirsin
    // örnek: final user = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: CustomAppBar(
        title: "Ana Sayfa",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),

      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.seed,
          backgroundColor: AppColors.beige,
          displacement: 40,
          strokeWidth: 2.5,
          onRefresh: _simulateRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text('Sıralama', style: _titleLg),
                      ),
                      TextButton(
                        onPressed: () {
                          ref.read(bottomNavProvider.notifier).state = 3;
                        },
                        child: const Text(
                          'Tümü',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const UserRankingCard(
                    username: 'Salih Kocatürk',
                    rank: 7,
                    points: 15040,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text('Shiftlerim', style: _titleLg),
                      ),
                      TextButton(
                        onPressed: null,
                        child: Text(
                          'Tümü',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  YourShiftsSection(activities: activities, onRefresh: () {}),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Senin İçin', style: _titleLg),
                  ),
                  RecommendedEventsSection(
                    recommended: recommended,
                    onRefresh: _simulateRefresh,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
