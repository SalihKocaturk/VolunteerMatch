import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prologue/core/constants/app_colors.dart';

class OrgSignUpStepOrganization extends StatefulWidget {
  final void Function(bool isValid) onValidChange;

  const OrgSignUpStepOrganization({super.key, required this.onValidChange});

  @override
  State<OrgSignUpStepOrganization> createState() =>
      _OrgSignUpStepOrganizationState();
}

class _OrgSignUpStepOrganizationState extends State<OrgSignUpStepOrganization> {
  final _orgName = TextEditingController();
  final _vkn = TextEditingController();

  String? _orgType;
  String? _orgNameError;
  String? _vknError;
  String? _orgTypeError;

  @override
  void initState() {
    super.initState();
    _validate();
  }

  @override
  void dispose() {
    _orgName.dispose();
    _vkn.dispose();
    super.dispose();
  }

  void _validate() {
    String? nameErr;
    String? vknErr;
    String? typeErr;

    if (_orgName.text.trim().isEmpty) {
      nameErr = 'Kurum adı zorunludur.';
    }

    final vknText = _vkn.text.trim();
    if (vknText.isEmpty) {
      vknErr = 'Vergi numarası zorunludur.';
    } else if (vknText.length != 10) {
      vknErr = 'VKN 10 haneli olmalıdır.';
    }

    if (_orgType == null) {
      typeErr = 'Kurum tipini seçmelisiniz.';
    }

    final valid = nameErr == null && vknErr == null && typeErr == null;

    setState(() {
      _orgNameError = nameErr;
      _vknError = vknErr;
      _orgTypeError = typeErr;
    });

    widget.onValidChange(valid);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _LabelText('Kurum adı'),
        const SizedBox(height: 6),
        _OrgTextField(
          controller: _orgName,
          hintText: 'Örn: Gülümse Derneği',
          onChanged: (_) => _validate(),
        ),
        if (_orgNameError != null) ...[
          const SizedBox(height: 4),
          _ErrorText(_orgNameError!),
        ],

        const SizedBox(height: 12),
        const _LabelText('Vergi numarası (VKN)'),
        const SizedBox(height: 6),
        _OrgTextField(
          controller: _vkn,
          hintText: '10 haneli VKN',
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          onChanged: (_) => _validate(),
        ),
        if (_vknError != null) ...[
          const SizedBox(height: 4),
          _ErrorText(_vknError!),
        ],

        const SizedBox(height: 16),
        const _LabelText('Kurum tipi'),
        const SizedBox(height: 8),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _TypeChip(
              label: 'Dernek',
              selected: _orgType == 'Dernek',
              onTap: () {
                setState(() => _orgType = 'Dernek');
                _validate();
              },
            ),
            _TypeChip(
              label: 'Vakıf',
              selected: _orgType == 'Vakıf',
              onTap: () {
                setState(() => _orgType = 'Vakıf');
                _validate();
              },
            ),
            _TypeChip(
              label: 'Şirket',
              selected: _orgType == 'Şirket',
              onTap: () {
                setState(() => _orgType = 'Şirket');
                _validate();
              },
            ),
            _TypeChip(
              label: 'Topluluk',
              selected: _orgType == 'Topluluk',
              onTap: () {
                setState(() => _orgType = 'Topluluk');
                _validate();
              },
            ),
            _TypeChip(
              label: 'Resmi Kurum',
              selected: _orgType == 'Resmi Kurum',
              onTap: () {
                setState(() => _orgType = 'Resmi Kurum');
                _validate();
              },
            ),
          ],
        ),
        if (_orgTypeError != null) ...[
          const SizedBox(height: 4),
          _ErrorText(_orgTypeError!),
        ],
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

class _OrgTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;

  const _OrgTextField({
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

class _TypeChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TypeChip({
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
