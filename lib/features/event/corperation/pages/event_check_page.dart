import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prologue/core/constants/app_colors.dart';
import 'package:prologue/core/widgets/custom_date_picker_field.dart';
import 'package:prologue/core/widgets/custom_image_picker_field.dart';
import 'package:prologue/core/widgets/custom_location_picker_field.dart';
import 'package:prologue/core/widgets/custom_text_field.dart';
import 'package:prologue/core/widgets/individual/appbar/custom_app_bar.dart';

import '../providers/participant_provider.dart';
import '../widgets/participant_item.dart';

class EventCheckPage extends ConsumerWidget {
  final String title;
  final String date;
  final String location;
  final String? photoUrl;

  const EventCheckPage({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(participantProvider);
    final notifier = ref.read(participantProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: const CustomAppBar(
        title: "Etkinlik Detayı",
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------------------------------------
            // FOTOĞRAF
            // ------------------------------------------------
            if (photoUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  photoUrl!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            const SizedBox(height: 22),

            // ------------------------------------------------
            // ETKİNLİK BAŞLIK & TARİH
            // ------------------------------------------------
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "$date — $location",
              style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
            ),

            const SizedBox(height: 26),

            // ------------------------------------------------
            // ETKİNLİK BİLGİLERİ (AddEventPage Field’ları)
            // ------------------------------------------------
            const Text(
              "Etkinlik Bilgileri",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 16),

            const CustomTextField(
              label: "Etkinlik Açıklaması",
              hint: "Etkinlik hakkında kısa bilgi",
            ),
            const SizedBox(height: 16),

            CustomImagePickerField(
              label: "Etkinlik Fotoğrafı",
              hint: "Fotoğraf ekle",
              onSelected: (f) {},
            ),
            const SizedBox(height: 16),

            CustomDatePickerField(
              label: "Tarih",
              hint: "Tarih seç",
              onSelected: (d) {},
            ),
            const SizedBox(height: 16),

            CustomLocationPickerField(label: "Konum", onSelected: (latlng) {}),
            const SizedBox(height: 16),

            const CustomTextField(
              label: "Sorumlu Kişi",
              hint: "Etkinliği yöneten kişi",
            ),
            const SizedBox(height: 16),

            const CustomTextField(label: "Minimum Katılımcı", hint: "Örn: 10"),
            const SizedBox(height: 16),

            const CustomTextField(
              label: "Etkinlik Türü",
              hint: "Örn: Sosyal Yardım",
            ),
            const SizedBox(height: 16),

            const CustomTextField(label: "Süre (Saat)", hint: "Örn: 3"),

            const SizedBox(height: 30),

            // ------------------------------------------------
            // KATILIMCI BAŞLIK
            // ------------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Katılımcılar",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),

                // ---- Hepsini İşaretle Chip ----
                InkWell(
                  onTap: notifier.checkAllFiltered,
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.forest.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 16,
                          color: AppColors.forest,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Hepsini İşaretle",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.forest,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // ---------------- SEARCH FIELD ---------------- //
            CustomTextField(
              label: "Katılımcı Ara",
              hint: "isim yaz...",
              isSearch: true,
              onChanged: (v) => notifier.setSearch(v),
            ),

            const SizedBox(height: 20),

            // ------------------------------------------------
            // KATILIMCI LİSTESİ
            // ------------------------------------------------
            for (final p in state.filtered)
              ParticipantItem(
                name: p.name,
                photoUrl: p.photo,
                checked: p.checked,
                onToggle: (value) => notifier.toggleCheck(p, value),
              ),
          ],
        ),
      ),
    );
  }
}
