import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/document_upload_state.dart';
import '../notifiers/document_upload_notifier.dart';

final documentUploadProvider =
    NotifierProvider<DocumentUploadNotifier, DocumentUploadState>(
      () => DocumentUploadNotifier(),
    );
