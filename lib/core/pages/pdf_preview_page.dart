import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfPreviewPage extends StatefulWidget {
  final File file;

  const PdfPreviewPage({super.key, required this.file});

  @override
  State<PdfPreviewPage> createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  late PdfControllerPinch pdfController;

  @override
  void initState() {
    super.initState();
    pdfController = PdfControllerPinch(
      document: PdfDocument.openFile(widget.file.path),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PDF Görüntüleyici")),
      body: PdfViewPinch(controller: pdfController),
    );
  }
}
