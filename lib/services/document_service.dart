import 'dart:io';

import 'package:file_picker/file_picker.dart';

class DocumentService {
  /// ------------------------------------------------------------
  /// TEK PDF SEÇ (pdf)
  /// ------------------------------------------------------------
  static Future<File?> pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    final path = result?.files.single.path;
    return path != null ? File(path) : null;
  }

  /// ------------------------------------------------------------
  /// TEK BELGE SEÇ (pdf, docx, jpg, png vs her şey)
  /// ------------------------------------------------------------
  static Future<File?> pickAnyDocument() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );

    final path = result?.files.single.path;
    return path != null ? File(path) : null;
  }

  /// ------------------------------------------------------------
  /// TEK FOTOĞRAF SEÇ (galeri)
  /// ------------------------------------------------------------
  static Future<File?> pickImageFromGallery() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    final path = result?.files.single.path;
    return path != null ? File(path) : null;
  }

  /// ------------------------------------------------------------
  /// BİRDEN ÇOK DOSYA SEÇ (pdf + image karışık)
  /// ------------------------------------------------------------
  static Future<List<File>> pickMultipleFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
    );

    if (result == null) return [];

    final files = result.paths.whereType<String>().map(File.new).toList();
    return files;
  }

  /// ------------------------------------------------------------
  /// BİRDEN ÇOK HER TÜRLÜ DOSYA SEÇ (zip dahil)
  /// ------------------------------------------------------------
  static Future<List<File>> pickAnyMultiple() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.any,
    );

    if (result == null) return [];

    final files = result.paths.whereType<String>().map(File.new).toList();
    return files;
  }
}
