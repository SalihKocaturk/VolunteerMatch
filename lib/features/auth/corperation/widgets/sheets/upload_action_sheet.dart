import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/services/document_service.dart';
import '../../../../../core/services/file_preview_service.dart';
import '../../../../../core/services/image_service.dart';
import '../upload_sheet_item.dart';

class UploadActionSheet extends StatelessWidget {
  final List<File> currentFiles;
  final Function(File file) onSelect;
  final Function(File file)? onRemove;

  const UploadActionSheet({
    super.key,
    required this.currentFiles,
    required this.onSelect,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final hasFiles = currentFiles.isNotEmpty;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _grabber(),
          const SizedBox(height: 16),

          //----------------------------------------------------------
          // 1) DOSYA VAR → Liste + (göz + menü)
          //----------------------------------------------------------
          if (hasFiles) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Yüklü Belgeler",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade700,
                ),
              ),
            ),

            ...currentFiles.map((file) {
              final filename = file.path.split('/').last;

              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),

                leading: Icon(
                  Icons.insert_drive_file_rounded,
                  color: AppColors.forest,
                  size: 26,
                ),

                title: Text(
                  filename,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // GÖZ (PREVIEW)
                    IconButton(
                      icon: Icon(
                        Icons.visibility_rounded,
                        color: AppColors.forest,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        FilePreviewService.openFilePreview(context, file);
                      },
                    ),

                    // ⋮ Menü
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (value) async {
                        if (value == "replace") {
                          final newFile =
                              await DocumentService.pickAnyDocument();
                          if (newFile != null) onSelect(newFile);
                          Navigator.pop(context);
                        } else if (value == "delete") {
                          onRemove?.call(file);
                          Navigator.pop(context);
                        }
                      },
                      itemBuilder: (_) => [
                        const PopupMenuItem(
                          value: "replace",
                          child: Text("Değiştir"),
                        ),
                        const PopupMenuItem(
                          value: "delete",
                          child: Text("Sil"),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 12),

            UploadSheetItem(
              icon: Icons.add_circle_outline,
              color: AppColors.forest,
              text: "Bir Belge Daha Ekle",
              onTap: () async {
                final file = await DocumentService.pickAnyDocument();
                if (file != null) onSelect(file);
                Navigator.pop(context);
              },
            ),
          ]
          //----------------------------------------------------------
          // 2) DOSYA YOK → Yükleme seçenekleri
          //----------------------------------------------------------
          else ...[
            UploadSheetItem(
              icon: Icons.picture_as_pdf_rounded,
              color: Colors.red.shade600,
              text: "PDF Yükle",
              onTap: () async {
                final file = await DocumentService.pickPdf();
                if (file != null) onSelect(file);
                Navigator.pop(context);
              },
            ),

            UploadSheetItem(
              icon: Icons.photo_library_rounded,
              color: Colors.blue.shade600,
              text: "Galeriden Fotoğraf",
              onTap: () async {
                final file = await ImageService.pickImageFromGallery();
                if (file != null) onSelect(file);
                Navigator.pop(context);
              },
            ),

            UploadSheetItem(
              icon: Icons.camera_alt_rounded,
              color: AppColors.forest,
              text: "Kamera ile Fotoğraf Çek",
              onTap: () async {
                final file = await ImageService.pickImageFromCamera();
                if (file != null) onSelect(file);
                Navigator.pop(context);
              },
            ),

            UploadSheetItem(
              icon: Icons.collections_rounded,
              color: Colors.teal,
              text: "Galeriden Çoklu Fotoğraf",
              onTap: () async {
                final list = await ImageService.pickMultipleImagesFromGallery();
                for (final f in list) {
                  onSelect(f);
                }
                Navigator.pop(context);
              },
            ),

            UploadSheetItem(
              icon: Icons.file_copy_rounded,
              color: Colors.purple,
              text: "Birden Çok Dosya Seç",
              onTap: () async {
                final list = await DocumentService.pickMultipleFiles();
                for (final f in list) {
                  onSelect(f);
                }
                Navigator.pop(context);
              },
            ),
          ],

          const SizedBox(height: 14),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "İptal",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  Widget _grabber() => Container(
    width: 42,
    height: 5,
    decoration: BoxDecoration(
      color: Colors.grey.shade400,
      borderRadius: BorderRadius.circular(6),
    ),
  );
}
