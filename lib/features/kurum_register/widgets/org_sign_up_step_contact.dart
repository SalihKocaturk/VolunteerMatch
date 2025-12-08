import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prologue/core/constants/app_colors.dart';

class OrgSignUpStepContact extends StatefulWidget {
  final void Function(bool isValid) onValidChange;

  const OrgSignUpStepContact({super.key, required this.onValidChange});

  @override
  State<OrgSignUpStepContact> createState() => _OrgSignUpStepContactState();
}

class _OrgSignUpStepContactState extends State<OrgSignUpStepContact> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _phoneError;

  @override
  void initState() {
    super.initState();
    _validate();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    super.dispose();
  }

  void _validate() {
    String? nameErr;
    String? mailErr;
    String? phoneErr;

    if (_name.text.trim().isEmpty) {
      nameErr = 'Yetkili kişi adı–soyadı zorunludur.';
    }

    final mailText = _email.text.trim();
    if (mailText.isEmpty) {
      mailErr = 'Kurumsal e-posta zorunludur.';
    } else if (!mailText.contains('@')) {
      mailErr = 'Geçerli bir e-posta giriniz.';
    }

    final phoneText = _phone.text.trim();
    if (phoneText.isEmpty) {
      phoneErr = 'Telefon numarası zorunludur.';
    } else if (phoneText.length != 10) {
      phoneErr = 'Telefonu başında 0 olmadan 10 haneli giriniz.';
    } else if (phoneText.startsWith('0')) {
      phoneErr = 'Baştaki 0 olmadan yazmalısınız (ör: 5xxxxxxxxx).';
    }

    final valid = nameErr == null && mailErr == null && phoneErr == null;

    setState(() {
      _nameError = nameErr;
      _emailError = mailErr;
      _phoneError = phoneErr;
    });

    widget.onValidChange(valid);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _LabelText('Yetkili kişi adı–soyadı'),
        const SizedBox(height: 6),
        _ContactTextField(
          controller: _name,
          hintText: 'Ad Soyad',
          onChanged: (_) => _validate(),
        ),
        if (_nameError != null) ...[
          const SizedBox(height: 4),
          _ErrorText(_nameError!),
        ],

        const SizedBox(height: 12),
        const _LabelText('Yetkilinin kurumsal mail adresi'),
        const SizedBox(height: 6),
        _ContactTextField(
          controller: _email,
          hintText: 'ornek@kurum.org',
          keyboardType: TextInputType.emailAddress,
          onChanged: (_) => _validate(),
        ),
        if (_emailError != null) ...[
          const SizedBox(height: 4),
          _ErrorText(_emailError!),
        ],

        const SizedBox(height: 12),
        const _LabelText('Telefon'),
        const SizedBox(height: 6),
        _ContactTextField(
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

        const SizedBox(height: 8),
        Text(
          'Bu bilgiler yalnızca kurum hesabı doğrulama ve iletişim '
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

class _ContactTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;

  const _ContactTextField({
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
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
