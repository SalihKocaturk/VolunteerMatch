import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../event/enums/activity_filter_type.dart';
import '../models/fyp_announcement.dart';
import '../models/fyp_award.dart';
import '../models/fyp_contribution.dart';
import '../provider/activity_filter_provider.dart';
import '../widgets/fyp_announcment_card.dart';
import '../widgets/fyp_award_card.dart';
import '../widgets/fyp_birthday_card.dart';
import '../widgets/fyp_contribition_card.dart';
import '../widgets/fyp_filter_bar.dart';

class FypPage extends ConsumerWidget {
  const FypPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilters = ref.watch(activityFilterProvider);

    // --- Örnek veri setleri ---
    final announcements = [
      FypAnnouncement(
        title: 'Yeni Etkinlik Serisi Başlıyor!',
        content:
            'Kasım ayı boyunca çevre farkındalığı temalı etkinlikler düzenleniyor.',
        date: '1 Kasım 2025',
        imageUrl: 'https://picsum.photos/seed/event/600/300',
      ),
      FypAnnouncement(
        title: 'Bağış Kampanyası Tamamlandı!',
        content:
            'Toplam 540 bağış toplandı, teşekkürler gönüllüler! Yeni kampanyalar yakında.',
        date: '29 Ekim 2025',
        imageUrl: 'https://picsum.photos/seed/donation/600/300',
      ),
    ];

    final awards = [
      FypAward(
        title: 'Haftanın Gönüllüsü',
        username: 'Salih Kocatürk',
        points: 1340,
        imageUrl:
            'https://cdn.pixabay.com/photo/2021/02/20/10/28/avatar-6030731_960_720.png',
        description: 'Bu hafta en çok gönüllü katkısı yapan kullanıcı!',
      ),
      FypAward(
        title: 'Ayın Yardımseveri',
        username: 'Elif Yılmaz',
        points: 980,
        imageUrl:
            'https://cdn.pixabay.com/photo/2020/07/01/12/58/avatar-5364673_960_720.png',
        description: 'Kasım ayında 3 etkinlik organize etti.',
      ),
    ];

    final contributions = [
      FypContribution(
        category: 'Sokak Hayvanları',
        count: 42,
        iconUrl: 'https://cdn-icons-png.flaticon.com/512/616/616408.png',
        description: 'Bu ay 42 gönüllü hayvan dostlarımız için katkı sağladı.',
      ),
      FypContribution(
        category: 'Ağaç Dikimi',
        count: 58,
        iconUrl: 'https://cdn-icons-png.flaticon.com/512/427/427735.png',
        description: '58 yeni fidan doğayla buluştu!',
      ),
    ];

    final showAll = selectedFilters.contains(ActivityFilterType.all);

    // 🔖 Bölüm başlığı stili
    const sectionTitleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: AppColors.text,
    );

    Widget buildSection(String title, List<Widget> children) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: sectionTitleStyle),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Tümü',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ...children,
          const SizedBox(height: 18),
        ],
      );
    }

    // 🔧 Seçili filtrelere göre dinamik içerik oluştur
    final widgets = <Widget>[];

    if (showAll || selectedFilters.contains(ActivityFilterType.announcements)) {
      widgets.add(
        buildSection(
          'Duyurular',
          announcements
              .map((a) => FypAnnouncementCard(announcement: a))
              .toList(),
        ),
      );
    }

    if (showAll || selectedFilters.contains(ActivityFilterType.requests)) {
      widgets.add(
        buildSection(
          'Ödüller',
          awards.map((a) => FypAwardCard(award: a)).toList(),
        ),
      );
    }

    if (showAll || selectedFilters.contains(ActivityFilterType.events)) {
      widgets.add(
        buildSection(
          'Katkılarımız',
          contributions
              .map((c) => FypContributionCard(contribution: c))
              .toList(),
        ),
      );
    }

    if (showAll || selectedFilters.contains(ActivityFilterType.unread)) {
      widgets.add(
        buildSection('Doğum Günleri', const [
          FypBirthdayCard(),
          FypBirthdayCard(),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Keşfet',
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          const FypFilterBar(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(children: widgets),
            ),
          ),
        ],
      ),
    );
  }
}
