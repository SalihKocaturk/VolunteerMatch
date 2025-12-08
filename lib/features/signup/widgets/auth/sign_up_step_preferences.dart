import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class SignUpStepPreferences extends StatefulWidget {
  final void Function(bool isValid) onValidChange;

  const SignUpStepPreferences({super.key, required this.onValidChange});

  @override
  State<SignUpStepPreferences> createState() => _SignUpStepPreferencesState();
}

class _SignUpStepPreferencesState extends State<SignUpStepPreferences> {
  final Set<String> _interests = {};
  final Set<String> _skills = {};
  final Set<String> _days = {};

  String? _interestsError;

  @override
  void initState() {
    super.initState();
    _validate();
  }

  void _validate() {
    String? interestsErr;
    if (_interests.isEmpty) {
      interestsErr = 'En az bir ilgi alanı seçmelisiniz.';
    }

    final valid = interestsErr == null;

    setState(() {
      _interestsError = interestsErr;
    });

    widget.onValidChange(valid);
  }

  void _toggle(Set<String> set, String key) {
    setState(() {
      if (set.contains(key)) {
        set.remove(key);
      } else {
        set.add(key);
      }
    });
    _validate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabelText('İlgi alanların'),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _ChoiceChip(
              label: 'Çocuklarla çalışma',
              selected: _interests.contains('cocuk'),
              onTap: () => _toggle(_interests, 'cocuk'),
            ),
            _ChoiceChip(
              label: 'Yaşlı bakımı',
              selected: _interests.contains('yasli'),
              onTap: () => _toggle(_interests, 'yasli'),
            ),
            _ChoiceChip(
              label: 'Çevre / doğa',
              selected: _interests.contains('cevre'),
              onTap: () => _toggle(_interests, 'cevre'),
            ),
            _ChoiceChip(
              label: 'Sokak hayvanları',
              selected: _interests.contains('hayvan'),
              onTap: () => _toggle(_interests, 'hayvan'),
            ),
            _ChoiceChip(
              label: 'Eğitim / mentorluk',
              selected: _interests.contains('egitim'),
              onTap: () => _toggle(_interests, 'egitim'),
            ),
          ],
        ),
        if (_interestsError != null) ...[
          const SizedBox(height: 4),
          _ErrorText(_interestsError!),
        ],

        const SizedBox(height: 16),
        _LabelText('Becerilerin'),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _ChoiceChip(
              label: 'İletişim',
              selected: _skills.contains('iletisim'),
              onTap: () => _toggle(_skills, 'iletisim'),
            ),
            _ChoiceChip(
              label: 'Organizasyon',
              selected: _skills.contains('organizasyon'),
              onTap: () => _toggle(_skills, 'organizasyon'),
            ),
            _ChoiceChip(
              label: 'Yabancı dil',
              selected: _skills.contains('dil'),
              onTap: () => _toggle(_skills, 'dil'),
            ),
            _ChoiceChip(
              label: 'Sosyal medya',
              selected: _skills.contains('sosyal'),
              onTap: () => _toggle(_skills, 'sosyal'),
            ),
            _ChoiceChip(
              label: 'Problem çözme',
              selected: _skills.contains('problem'),
              onTap: () => _toggle(_skills, 'problem'),
            ),
          ],
        ),

        const SizedBox(height: 16),
        _LabelText('Müsait olduğun zamanlar'),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _ChoiceChip(
              label: 'Hafta içi akşam',
              selected: _days.contains('haftaici'),
              onTap: () => _toggle(_days, 'haftaici'),
            ),
            _ChoiceChip(
              label: 'Hafta sonu',
              selected: _days.contains('haftasonu'),
              onTap: () => _toggle(_days, 'haftasonu'),
            ),
            _ChoiceChip(
              label: 'Sadece online',
              selected: _days.contains('online'),
              onTap: () => _toggle(_days, 'online'),
            ),
          ],
        ),

        const SizedBox(height: 10),
        Text(
          'Bu tercihler, sana en uygun gönüllülük fırsatlarını önermek için '
          'kullanılacak. Dilersen daha sonra da profil sayfasından güncelleyebilirsin.',
          style: TextStyle(
            color: AppColors.forest.withOpacity(.85),
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

class _ChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ChoiceChip({
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
