import 'package:flutter/material.dart';

import '../../fyp/models/activity.dart';
import 'shift_card.dart';

class YourShiftsSection extends StatelessWidget {
  final List<Activity> activities;
  final VoidCallback onRefresh;

  const YourShiftsSection({
    super.key,
    required this.activities,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 12, bottom: 24, right: 8),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: IntrinsicWidth(
              // Row'a finite constraint verir
              child: Row(
                mainAxisSize: MainAxisSize.min, // shrink-wrap davranışı
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final a in activities) ...[
                    ShiftCard(activity: a),
                    const SizedBox(width: 8),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
