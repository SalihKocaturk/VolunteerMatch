import 'dart:io';

import 'package:flutter/material.dart';

import '../pages/image_preview_page.dart';
import '../pages/pdf_preview_page.dart';

class FilePreviewService {
  static void openFilePreview(BuildContext context, File file) {
    final path = file.path.toLowerCase();

    if (path.endsWith(".png") ||
        path.endsWith(".jpg") ||
        path.endsWith(".jpeg") ||
        path.endsWith(".heic")) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ImagePreviewPage(file: file)),
      );
      return;
    }

    if (path.endsWith(".pdf")) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => PdfPreviewPage(file: file)),
      );
      return;
    }

    // desteklenmeyen format → toast, snackbar vs.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Bu dosya formatı görüntülenemiyor.")),
    );
  }
}
