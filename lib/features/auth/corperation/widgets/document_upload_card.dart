import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../providers/document_upload_provider.dart';
import 'sheets/upload_action_sheet.dart';

class DocumentUploadCard extends ConsumerWidget {
  final String title;

  const DocumentUploadCard({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final files = ref.watch(documentUploadProvider).files[title] ?? [];
    final count = files.length;
    final hasFiles = count > 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.forest.withOpacity(0.25),
          width: 1.3,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),

          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) => UploadActionSheet(
                  currentFiles: files, // <<< DÜZELTİLDİ (artık liste gidiyor)

                  onRemove: (file) {
                    ref
                        .read(documentUploadProvider.notifier)
                        .removeFile(title, file);
                  },
                  onSelect: (newFile) {
                    ref
                        .read(documentUploadProvider.notifier)
                        .addFile(title, newFile);
                  },
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: AppColors.beige.withOpacity(0.45),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.forest.withOpacity(0.30)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      hasFiles
                          ? Icons.folder_copy_rounded
                          : Icons.cloud_upload_rounded,
                      size: 42,
                      color: AppColors.forest.withOpacity(0.8),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      hasFiles
                          ? "$count belge yüklendi"
                          : "Yüklemek için dokunun",
                      style: TextStyle(
                        color: hasFiles
                            ? AppColors.forest
                            : Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
