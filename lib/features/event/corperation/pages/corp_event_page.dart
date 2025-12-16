import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import 'package:prologue/core/navigation/debug_navigate.dart';
import 'package:prologue/core/widgets/individual/appbar/custom_app_bar.dart';
import 'package:prologue/features/event/corperation/pages/add_event_page.dart';

import '../widgets/corp_event_card.dart';
import 'event_check_page.dart';

class CorpEventPage extends StatelessWidget {
  const CorpEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final events = [
      {
        "title": "Sahilde Çöp Toplama",
        "date": "12 Mart 2025",
        "location": "Kadıköy, İstanbul",
        "status": "Aktif",
        "photo": "https://picsum.photos/seed/cleanup/600/300",
      },
      {
        "title": "Yaşlı Bakım Evi Ziyareti",
        "date": "22 Mart 2025",
        "location": "Üsküdar, İstanbul",
        "status": "Tamamlandı",
        "photo":
            "https://www.ikincibahar.com.tr/wp-content/uploads/maltepe-huzurevi-bakimevi.jpg",
      },
      {
        "title": "Fidan Dikme Etkinliği",
        "date": "2 Nisan 2025",
        "location": "Belgrad Ormanı",
        "status": "Aktif",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: CustomAppBar(
        title: 'Etkinlikler',
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: AppColors.text),
            onPressed: () {
              NavHelper.push(context, const AddEventPage());
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.text),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          child: Column(
            children: [
              for (final e in events)
                CorpEventCard(
                  title: e["title"]!,
                  date: e["date"]!,
                  location: e["location"]!,
                  status: e["status"]!,
                  photoUrl: e["photo"],
                  onTap: () {
                    NavHelper.push(
                      context,
                      EventCheckPage(
                        title: e["title"]!,
                        date: e["date"]!,
                        location: e["location"]!,
                        photoUrl: e["photo"],
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
