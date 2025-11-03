import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

import '../../../core/widgets/appbar/custom_app_bar.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController aboutController = TextEditingController(
    text:
        'Teknolojiye, gönüllülüğe ve doğa projelerine ilgi duyan bir katılımcı.',
  );
  final TextEditingController ageController = TextEditingController(text: '23');
  final TextEditingController cityController = TextEditingController(
    text: 'Kocaeli',
  );
  final TextEditingController addressController = TextEditingController(
    text: 'İzmit / Kocaeli',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: CustomAppBar(implyLeading: true, title: "Profili Düzenle"),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField('Hakkında', aboutController, maxLines: 4),
            const SizedBox(height: 14),
            _buildTextField('', ageController, keyboard: TextInputType.number),
            const SizedBox(height: 14),
            _buildTextField('Şehir', cityController),
            const SizedBox(height: 14),
            _buildTextField('Adres', addressController, maxLines: 2),
            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide(color: AppColors.seed, width: 1.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Vazgeç',
                      style: TextStyle(
                        color: AppColors.seed,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      // 🔹 Burada backend veya provider güncelleme yapılabilir
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Değişiklikler kaydedildi.'),
                        ),
                      );
                      Navigator.pop(context);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.seed,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Kaydet',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Tekrarlanan alanlar için widget
  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    TextInputType? keyboard,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboard,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkBg.withOpacity(.2),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.seed, width: 1.6),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
