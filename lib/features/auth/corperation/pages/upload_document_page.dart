import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/document_upload_provider.dart';
import '../widgets/document_upload_card.dart';

class DocumentUploadPage extends ConsumerWidget {
  const DocumentUploadPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(documentUploadProvider.notifier);

    final documents = [
      "Vergi Levhası",
      "Kuruluş Belgesi / Tüzük",
      "Yetkili Kimlik (Ön + Arka)",
      "Yetki Belgesi",
    ];

    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black87,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),

              // Soft header
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.55),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text(
                  "Kurum doğrulaması için aşağıdaki belgeleri yüklemelisiniz.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.4,
                    color: Color(0xFF24323C),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: documents.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    return DocumentUploadCard(title: documents[index]);
                  },
                ),
              ),

              const SizedBox(height: 10),
              PrimaryButton(
                label: "Başvuruyu Gönder",
                onPressed: () {
                  if (!notifier.allUploaded()) {
                    // uyarı göster
                    return;
                  }

                  final files = ref.read(documentUploadProvider).files;
                },
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
