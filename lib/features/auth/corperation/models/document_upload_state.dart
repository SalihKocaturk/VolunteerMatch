import 'dart:io';

class DocumentUploadState {
  final Map<String, List<File>> files;

  const DocumentUploadState({required this.files});

  DocumentUploadState copyWith({Map<String, List<File>>? files}) {
    return DocumentUploadState(files: files ?? this.files);
  }
}
