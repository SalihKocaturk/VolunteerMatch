import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../theme/custom_input_decoration.dart';

class CustomImagePickerField extends StatefulWidget {
  final String label;
  final String? hint;
  final ValueChanged<File?> onSelected;

  const CustomImagePickerField({
    super.key,
    required this.label,
    required this.onSelected,
    this.hint,
  });

  @override
  State<CustomImagePickerField> createState() => _CustomImagePickerFieldState();
}

class _CustomImagePickerFieldState extends State<CustomImagePickerField> {
  File? selectedFile;

  Future<void> _pick(ImageSource source) async {
    final picker = ImagePicker();
    final x = await picker.pickImage(source: source);

    if (x != null) {
      setState(() => selectedFile = File(x.path));
      widget.onSelected(selectedFile);
    }
  }

  void _openPickerSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Kamera"),
                onTap: () {
                  Navigator.pop(context);
                  _pick(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Galeriden Seç"),
                onTap: () {
                  Navigator.pop(context);
                  _pick(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openPickerSheet,
      child: AbsorbPointer(
        // gerçek input davranışı, dokunma engelli
        child: TextField(
          readOnly: true,
          decoration:
              buildCustomInputDecoration(
                label: widget.label,
                hint: widget.hint ?? "Fotoğraf ekle",
                suffixIcon: const Icon(Icons.image_outlined),
              ).copyWith(
                // Seçilen dosya adını gösterebilmek için override
                hintText: selectedFile != null
                    ? selectedFile!.path.split("/").last
                    : widget.hint,
              ),
        ),
      ),
    );
  }
}
