import 'package:flutter/material.dart';
import 'package:prologue/core/widgets/app_logo.dart';
import 'package:prologue/features/home/widgets/user_ranking_card.dart';

import '../../../core/constants/app_colors.dart';
import '../../fyp/models/activity.dart';
import '../widgets/recommended_events_section.dart';
import '../widgets/user_level_section.dart';
import '../widgets/your_shifts_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const TextStyle _titleLg = TextStyle(
    color: AppColors.text,
    fontWeight: FontWeight.w800,
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    final activities = [
      Activity(
        id: '1',
        title: 'Charity Shop Rota',
        description: 'Helping at the elderly care center for donations.',
        location: 'Elderly Care, İstanbul',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/3/3d/Charity_shop.jpg',
        date: DateTime(2025, 11, 17),
        points: 60,
      ),
      Activity(
        id: '2',
        title: 'Befriending',
        description: 'Visiting seniors and having a friendly talk.',
        location: 'Bakırköy / İstanbul',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/1/1e/Old_people_visiting.jpg',
        date: DateTime(2025, 11, 18),
        points: 50,
      ),
    ];

    final recommended = [
      Activity(
        id: '3',
        title: 'Fidan Dikim Günü',
        description: 'Katıl ve doğaya katkı sağla!',
        location: 'Polonezköy / İstanbul',
        imageUrl: 'https://picsum.photos/seed/tree/600/400',
        date: DateTime(2025, 12, 1),
        points: 80,
      ),
      Activity(
        id: '4',
        title: 'Sokak Hayvanları için Mama Dağıtımı',
        description: 'Sevimli dostlarımızı besleme etkinliği.',
        location: 'Beşiktaş / İstanbul',
        imageUrl:
            'https://www.hataygazetesi.com/userdata/urunResimleri/dortyolda-mama-dagitimi-yapildi.jpg',
        date: DateTime(2025, 11, 15),
        points: 100,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.beige,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        centerTitle: true,
        title: Row(
          children: const [
            AppLogo(),
            SizedBox(width: 10),
            Text(
              'Gönüllü Uygulaması',
              style: TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: const Text('Sıralama', style: _titleLg),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Tümü',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                UserRankingCard(
                  username: 'Salih Kocatürk',
                  rank: 4,
                  points: 1340,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: const Text('Shiftlerim', style: _titleLg),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Tümü',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                YourShiftsSection(activities: activities, onRefresh: () {}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: const Text('Seviyem', style: _titleLg),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Daha Fazla',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                UserLevelSection(),
                SizedBox(height: 16),

                RecommendedEventsSection(
                  recommended: recommended,
                  onRefresh: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
