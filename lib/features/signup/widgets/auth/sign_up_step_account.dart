import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class SignUpStepAccount extends StatefulWidget {
  final void Function(bool isValid) onValidChange;

  const SignUpStepAccount({super.key, required this.onValidChange});

  @override
  State<SignUpStepAccount> createState() => _SignUpStepAccountState();
}

class _SignUpStepAccountState extends State<SignUpStepAccount> {
  final _name = TextEditingController();
  final _surname = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _pass2 = TextEditingController();

  bool _obscure = true;
  bool _acceptTerms = false;

  String? _nameError;
  String? _surnameError;
  String? _emailError;
  String? _passError;
  String? _pass2Error;

  @override
  void initState() {
    super.initState();
    _validate();
  }

  @override
  void dispose() {
    _name.dispose();
    _surname.dispose();
    _email.dispose();
    _pass.dispose();
    _pass2.dispose();
    super.dispose();
  }

  void _validate() {
    String? nameErr;
    String? surnameErr;
    String? emailErr;
    String? passErr;
    String? pass2Err;

    if (_name.text.trim().isEmpty) {
      nameErr = 'Ad zorunludur.';
    }
    if (_surname.text.trim().isEmpty) {
      surnameErr = 'Soyad zorunludur.';
    }
    if (_email.text.trim().isEmpty) {
      emailErr = 'E-posta zorunludur.';
    } else if (!_email.text.contains('@')) {
      emailErr = 'Geçerli bir e-posta giriniz.';
    }

    if (_pass.text.isEmpty) {
      passErr = 'Şifre zorunludur.';
    } else if (_pass.text.length < 6) {
      passErr = 'Şifre en az 6 karakter olmalı.';
    }

    if (_pass2.text.isEmpty) {
      pass2Err = 'Şifre tekrarı zorunludur.';
    } else if (_pass.text != _pass2.text) {
      pass2Err = 'Şifreler eşleşmiyor.';
    }

    final valid =
        nameErr == null &&
        surnameErr == null &&
        emailErr == null &&
        passErr == null &&
        pass2Err == null &&
        _acceptTerms;

    setState(() {
      _nameError = nameErr;
      _surnameError = surnameErr;
      _emailError = emailErr;
      _passError = passErr;
      _pass2Error = pass2Err;
    });

    widget.onValidChange(valid);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabelText('Ad'),
        const SizedBox(height: 6),
        _SignUpTextField(
          controller: _name,
          hintText: 'Adınız',
          onChanged: (_) => _validate(),
        ),
        if (_nameError != null) ...[
          const SizedBox(height: 4),
          _ErrorText(_nameError!),
        ],

        const SizedBox(height: 12),
        _LabelText('Soyad'),
        const SizedBox(height: 6),
        _SignUpTextField(
          controller: _surname,
          hintText: 'Soyadınız',
          onChanged: (_) => _validate(),
        ),
        if (_surnameError != null) ...[
          const SizedBox(height: 4),
          _ErrorText(_surnameError!),
        ],

        const SizedBox(height: 12),
        _LabelText('E-posta'),
        const SizedBox(height: 6),
        _SignUpTextField(
          controller: _email,
          hintText: 'ornek@mail.com',
          keyboardType: TextInputType.emailAddress,
          onChanged: (_) => _validate(),
        ),
        if (_emailError != null) ...[
          const SizedBox(height: 4),
          _ErrorText(_emailError!),
        ],

        const SizedBox(height: 12),
        _LabelText('Şifre'),
        const SizedBox(height: 6),
        _SignUpTextField(
          controller: _pass,
          hintText: 'Şifreniz',
          obscureText: _obscure,
          onChanged: (_) => _validate(),
          suffix: IconButton(
            icon: Icon(
              _obscure
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: AppColors.forest.withOpacity(.8),
              size: 20,
            ),
            onPressed: () {
              setState(() => _obscure = !_obscure);
            },
          ),
        ),
        if (_passError != null) ...[
          const SizedBox(height: 4),
          _ErrorText(_passError!),
        ],

        const SizedBox(height: 12),
        _LabelText('Şifre (Tekrar)'),
        const SizedBox(height: 6),
        _SignUpTextField(
          controller: _pass2,
          hintText: 'Şifrenizi tekrar girin',
          obscureText: true,
          onChanged: (_) => _validate(),
        ),
        if (_pass2Error != null) ...[
          const SizedBox(height: 4),
          _ErrorText(_pass2Error!),
        ],

        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: _acceptTerms,
              activeColor: AppColors.seed,
              onChanged: (v) {
                setState(() => _acceptTerms = v ?? false);
                _validate();
              },
            ),
            Expanded(
              child: Text(
                'Kullanım koşullarını ve KVKK aydınlatma metnini '
                'okudum, kabul ediyorum.',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
        if (!_acceptTerms)
          _ErrorText('Devam etmek için bu kutuyu işaretlemelisiniz.'),
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
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final ValueChanged<String>? onChanged;

  const _SignUpTextField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.suffix,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
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
        suffixIcon: suffix,
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
