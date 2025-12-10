import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/document_upload_state.dart';

class DocumentUploadNotifier extends Notifier<DocumentUploadState> {
  @override
  DocumentUploadState build() {
    return DocumentUploadState(
      files: {
        "Vergi Levhası": [],
        "Kuruluş Belgesi / Tüzük": [],
        "Yetkili Kimlik (Ön + Arka)": [],
        "Yetki Belgesi": [],
      },
    );
  }

  List<File> _safeList(String title) {
    return state.files[title] ?? <File>[];
  }

  // Tek veya çoklu ekleme
  void addFile(String title, File file) {
    final updated = Map<String, List<File>>.from(state.files);

    final list = _safeList(title);
    updated[title] = [...list, file];

    state = state.copyWith(files: updated);
  }

  // İlk dosyayı değiştir
  void replaceFile(String title, File file) {
    final updated = Map<String, List<File>>.from(state.files);

    final list = _safeList(title);

    if (list.isEmpty) {
      updated[title] = [file];
    } else {
      final newList = List<File>.from(list);
      newList[0] = file;
      updated[title] = newList;
    }

    state = state.copyWith(files: updated);
  }

  // Belirli dosyayı sil
  void removeFile(String title, File file) {
    final updated = Map<String, List<File>>.from(state.files);

    final list = _safeList(title);
    updated[title] = list.where((f) => f.path != file.path).toList();

    state = state.copyWith(files: updated);
  }

  // Tüm dosyaları sil
  void removeAll(String title) {
    final updated = Map<String, List<File>>.from(state.files);
    updated[title] = [];
    state = state.copyWith(files: updated);
  }

  // Belge var mı?
  bool hasFiles(String title) {
    return _safeList(title).isNotEmpty;
  }

  // Tüm belgelerde en az 1 tane yüklü mü?
  bool allUploaded() {
    return state.files.values.every((list) => list.isNotEmpty);
  }
}
