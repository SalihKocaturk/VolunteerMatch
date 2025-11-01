import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../models/event.dart';
import '../providers/event_filter_provider.dart';
import '../widgets/event_card.dart';
import '../widgets/event_filter_bar.dart';

class EventPage extends ConsumerWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(eventFilterProvider);

    final events = [
      Event(
        id: '1',
        title: 'Doğa Temizliği Etkinliği',
        description:
            'Doğayı korumak için sahil temizliği etkinliğinde buluşuyoruz.',
        location: 'Kadıköy / İstanbul',
        imageUrl: 'https://picsum.photos/seed/cleanup/600/300',
        date: DateTime(2025, 11, 15),
        importance: EventImportance.high,
        points: 120,
        joinState: EventJoinState.pending,
      ),
      Event(
        id: '2',
        title: 'Yaşlı Bakım Evi Ziyareti',
        description: 'Sohbet ve yardım amaçlı gönüllü ziyaretler düzenleniyor.',
        location: 'Bakırköy / İstanbul',
        imageUrl:
            'https://www.ikincibahar.com.tr/wp-content/uploads/maltepe-huzurevi-bakimevi.jpg',
        date: DateTime(2025, 11, 18),
        importance: EventImportance.medium,
        points: 90,
        joinState: EventJoinState.notJoined,
      ),
      Event(
        id: '3',
        title: 'Kan Bağışı Günü',
        description: 'Sağlık Bakanlığı işbirliğiyle kan bağışı etkinliği.',
        location: 'Şişli / İstanbul',
        imageUrl: 'https://picsum.photos/seed/blood/600/300',
        date: DateTime(2025, 11, 20),
        importance: EventImportance.medium,
        points: 100,
        joinState: EventJoinState.joined,
      ),
    ];

    final filtered = events.where((e) {
      switch (selected) {
        case EventFilterType.notJoined:
          return e.joinState == EventJoinState.notJoined;
        case EventFilterType.pending:
          return e.joinState == EventJoinState.pending;
        case EventFilterType.joined:
          return e.joinState == EventJoinState.joined;
      }
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Etkinlikler',
          style: TextStyle(color: AppColors.text, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const EventFilterBar(),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, i) =>
                  EventCard(event: filtered[i], onJoin: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
