import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({super.key, required this.title, required this.children});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.darkBg.withOpacity(.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: t.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.darkBg,
            ),
          ),
          const SizedBox(height: 12),
          ..._withGaps(children),
        ],
      ),
    );
  }

  List<Widget> _withGaps(List<Widget> list) {
    final out = <Widget>[];
    for (var i = 0; i < list.length; i++) {
      out.add(list[i]);
      if (i != list.length - 1) out.add(const SizedBox(height: 10));
    }
    return out;
  }
}
