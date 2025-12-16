import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import 'package:prologue/core/widgets/custom_date_picker_field.dart';
import 'package:prologue/core/widgets/custom_location_picker_field.dart';
import 'package:prologue/core/widgets/custom_text_field.dart';
import 'package:prologue/core/widgets/individual/appbar/custom_app_bar.dart';

import '../../../../core/widgets/custom_image_picker_field.dart';

class AddEventPage extends StatelessWidget {
  const AddEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: const CustomAppBar(title: 'Etkinlik Ekle', showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Etkinlik Adı
              const CustomTextField(
                label: 'Etkinlik Adı',
                hint: 'Örn: “Sahilde Çöp Toplama”',
              ),
              const SizedBox(height: 16),

              // Açıklama
              const CustomTextField(
                label: 'Etkinlik Açıklaması',
                hint: 'Etkinlik hakkında detaylı bilgi',
              ),
              const SizedBox(height: 16),
              CustomImagePickerField(
                label: "Etkinlik Fotoğrafı",
                hint: "Fotoğraf ekle",
                onSelected: (file) {
                  debugPrint("Seçilen fotoğraf: $file");
                },
              ),
              const SizedBox(height: 16),

              // Tarih picker
              CustomDatePickerField(
                label: 'Tarih',
                hint: 'Tarih seç',
                onSelected: (date) {
                  debugPrint("Seçilen tarih: $date");
                },
              ),
              const SizedBox(height: 16),

              // Konum picker
              CustomLocationPickerField(
                label: "Konum",
                onSelected: (latlng) {
                  print("Seçilen konum: $latlng");
                },
              ),

              const SizedBox(height: 16),

              // Sorumlu kişi
              const CustomTextField(
                label: 'Sorumlu Kişi',
                hint: 'Etkinliği yöneten kişi',
              ),
              const SizedBox(height: 16),

              // Minimum katılımcı
              const CustomTextField(
                label: 'Minimum Katılımcı Sayısı',
                hint: 'Örn: 10',
              ),
              const SizedBox(height: 16),

              // Etkinlik türü
              const CustomTextField(
                label: 'Etkinlik Türü',
                hint: 'Örn: Sosyal Yardım, Eğitim...',
              ),
              const SizedBox(height: 16),

              // Süre (saat)
              const CustomTextField(
                label: 'Etkinlik Süresi (Saat)',
                hint: 'Örn: 3',
              ),
              const SizedBox(height: 32),

              // Kaydet butonu (placeholder olarak)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppColors.forest,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Etkinliği Oluştur',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
