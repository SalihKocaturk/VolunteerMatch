import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prologue/core/constants/app_colors.dart';

class SignUpStepProfile extends StatefulWidget {
  final void Function(bool isValid) onValidChange;

  const SignUpStepProfile({super.key, required this.onValidChange});

  @override
  State<SignUpStepProfile> createState() => _SignUpStepProfileState();
}

class _SignUpStepProfileState extends State<SignUpStepProfile> {
  final _city = TextEditingController();
  final _phone = TextEditingController();
  final _birthDateController = TextEditingController();

  DateTime? _birthDate;
  String? _selectedGender;
  String? _phoneError;
  String? _genderError;

  @override
  void initState() {
    super.initState();
    _validate();
  }

  @override
  void dispose() {
    _city.dispose();
    _phone.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  void _validate() {
    String? phoneErr;
    String? genderErr;

    final phoneText = _phone.text.trim();

    if (phoneText.isEmpty) {
      phoneErr = 'Telefon numarası zorunludur.';
    } else if (phoneText.length != 10) {
      phoneErr = 'Telefonu başında 0 olmadan 10 haneli giriniz.';
    } else if (phoneText.startsWith('0')) {
      phoneErr = 'Baştaki 0 olmadan yazmalısınız (ör: 5xxxxxxxxx).';
    }

    if (_selectedGender == null) {
      genderErr = 'Cinsiyet seçimi zorunludur.';
    }

    final valid = phoneErr == null && genderErr == null;

    setState(() {
      _phoneError = phoneErr;
      _genderError = genderErr;
    });

    widget.onValidChange(valid);
  }

  Future<void> _pickBirthDate() async {
    final now = DateTime.now();
    // Varsayılan: 20 yaş civarı
    final initial = DateTime(now.year - 20, now.month, now.day);
    // Maks: 100 yaş
    final first = DateTime(now.year - 100, 1, 1);
    // Min: 16 yaş
    final last = DateTime(now.year - 16, now.month, now.day);

    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: first,
      lastDate: last,
      helpText: 'Doğum tarihinizi seçin',
      cancelText: 'İptal',
      confirmText: 'Tamam',
    );

    if (picked != null) {
      setState(() {
        _birthDate = picked;
        final d = picked.day.toString().padLeft(2, '0');
        final m = picked.month.toString().padLeft(2, '0');
        _birthDateController.text = '$d.$m.${picked.year}';
      });
      _validate(); // Zorunlu değil ama gelecekte kullanmak istersen hazır
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabelText('Şehir'),
        const SizedBox(height: 6),
        _SignUpTextField(
          controller: _city,
          hintText: 'Örn: İstanbul',
          onChanged: (_) => _validate(),
        ),

        const SizedBox(height: 12),
        _LabelText('Telefon (zorunlu, başında 0 olmadan)'),
        const SizedBox(height: 6),
        _SignUpTextField(
          controller: _phone,
          hintText: '5xxxxxxxxx',
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          onChanged: (_) => _validate(),
        ),
        if (_phoneError != null) ...[
          const SizedBox(height: 4),
          _ErrorText(_phoneError!),
        ],

        const SizedBox(height: 12),
        _LabelText('Doğum tarihi'),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: _pickBirthDate,
          child: AbsorbPointer(
            child: _SignUpTextField(
              controller: _birthDateController,
              hintText: 'GG.AA.YYYY',
              keyboardType: TextInputType.datetime,
              onChanged: (_) {},
              suffix: Icon(
                Icons.calendar_today_rounded,
                size: 18,
                color: AppColors.forest.withOpacity(.8),
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),
        _LabelText('Cinsiyet (zorunlu)'),
        const SizedBox(height: 8),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _GenderChip(
              label: 'Kadın',
              selected: _selectedGender == 'Kadın',
              onTap: () {
                setState(() => _selectedGender = 'Kadın');
                _validate();
              },
            ),
            _GenderChip(
              label: 'Erkek',
              selected: _selectedGender == 'Erkek',
              onTap: () {
                setState(() => _selectedGender = 'Erkek');
                _validate();
              },
            ),
            _GenderChip(
              label: 'Belirtmek istemiyorum',
              selected: _selectedGender == 'Belirtmek istemiyorum',
              onTap: () {
                setState(() => _selectedGender = 'Belirtmek istemiyorum');
                _validate();
              },
            ),
          ],
        ),
        if (_genderError != null) ...[
          const SizedBox(height: 4),
          _ErrorText(_genderError!),
        ],
        const SizedBox(height: 6),
        Text(
          'Telefon ve cinsiyet bilgisi, sadece güvenlik ve istatistik '
          'amaçlı kullanılacaktır.',
          style: TextStyle(
            color: AppColors.forest.withOpacity(.8),
            fontSize: 11,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}

class _LabelText extends StatelessWidget {
  final String text;
  const _LabelText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.text,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
    );
  }
}

class _SignUpTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;

  const _SignUpTextField({
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      style: TextStyle(color: AppColors.text),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.forest.withOpacity(.6)),
        filled: true,
        fillColor: AppColors.beige.withOpacity(.4),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.withOpacity(.4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.withOpacity(.35)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.seed, width: 1.4),
        ),
        suffixIcon: suffix,
      ),
    );
  }
}

class _GenderChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _GenderChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.seed.withOpacity(.16) : AppColors.white,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: selected ? AppColors.seed : Colors.grey.withOpacity(.35),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? AppColors.forest : AppColors.text,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class _ErrorText extends StatelessWidget {
  final String text;
  const _ErrorText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.red.shade700, fontSize: 11, height: 1.2),
    );
  }
}
