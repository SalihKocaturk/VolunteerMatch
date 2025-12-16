import 'package:flutter/material.dart';
import 'package:prologue/core/widgets/custom_card.dart';

import 'event_action_button.dart';
import 'event_image.dart';
import 'event_info_row.dart';
import 'event_status_badge.dart';
import 'event_title_row.dart';

class CorpEventCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String status;
  final String? photoUrl;

  /// 🔥 Yeni eklendi: Kartın tamamı için onTap
  final VoidCallback? onTap;

  const CorpEventCard({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    required this.status,
    this.photoUrl,
    this.onTap, // yeni parametre
  });

  @override
  Widget build(BuildContext context) {
    final isActive = status == "Aktif";

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),

      /// 👉 Kartı tıklanabilir yapmak için GestureDetector
      child: GestureDetector(
        onTap: onTap,
        child: CustomCard(
          borderRadius: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EventImage(photoUrl: photoUrl),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    EventTitleRow(title: title),
                    const SizedBox(height: 12),

                    EventInfoRow(icon: Icons.calendar_month, text: date),
                    const SizedBox(height: 8),

                    EventInfoRow(
                      icon: Icons.place_outlined,
                      text: location,
                      trailing: EventStatusBadge(status: status),
                    ),

                    const SizedBox(height: 18),

                    /// 🔥 Buton da ayrıca fonksiyon alıyor
                    EventActionButton(label: "İncele", onTap: onTap ?? () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
