import 'package:flutter/material.dart';

void debugNavigate(BuildContext context, String where) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Seçim: $where (navigasyon yer tutucu)')),
  );
}
