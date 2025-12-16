import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class ImageService {
  /// ✔ Galeriden TEK fotoğraf seçme
  static Future<File?> pickImageFromGallery() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      return File(result.files.single.path!);
    }
    return null;
  }

  /// ✔ Galeriden ÇOKLU fotoğraf seçme
  static Future<List<File>> pickMultipleImagesFromGallery() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result == null) return [];

    return result.files
        .where((f) => f.path != null)
        .map((f) => File(f.path!))
        .toList();
  }

  /// ✔ Kameradan TEK fotoğraf çekme

  static Future<File?> pickImageFromCamera() async {
    final picker = ImagePicker();

    final picked = await picker.pickImage(source: ImageSource.camera);

    if (picked != null) {
      return File(picked.path);
    }
    return null;
  }
}
