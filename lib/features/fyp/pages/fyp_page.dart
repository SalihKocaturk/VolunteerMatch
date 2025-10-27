import 'package:flutter/material.dart';
import 'package:prologue/core/widgets/app_logo.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/demo_data.dart';
import '../models/achivement.dart';
import '../widgets/achivement_section.dart';
import '../widgets/organizations_strip.dart';
import '../widgets/upcoming_events_carousel.dart';

class FypPage extends StatefulWidget {
  const FypPage({super.key});
  static const route = '/home';

  @override
  State<FypPage> createState() => _FypPageState();
}

class _FypPageState extends State<FypPage> {
  static const TextStyle _titleLg = TextStyle(
    color: AppColors.text,
    fontWeight: FontWeight.w800,
    fontSize: 22,
  );

  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;
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
                      child: const Text(
                        'Yaklaşan Etkinlikler',
                        style: _titleLg,
                      ),
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
                UpcomingEvents(events: demoEvents),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: const Text('Başarıların', style: _titleLg),
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
                AchievementsSection(
                  achievements: const [
                    Achievement(
                      icon: Icons.workspace_premium_rounded,
                      title: 'Leader',
                    ),
                    Achievement(
                      icon: Icons.volunteer_activism_rounded,
                      title: 'Helper',
                    ),
                    Achievement(
                      icon: Icons.handshake_rounded,
                      title: 'Partner',
                    ),
                    Achievement(icon: Icons.star_rounded, title: 'Achiever'),
                  ],
                ),

                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: const Text(
                    'En Çok Desteklenen Kurumlar',
                    style: _titleLg,
                  ),
                ),
                const SizedBox(height: 8),
                OrganizationsStrip(orgs: demoOrgs),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
