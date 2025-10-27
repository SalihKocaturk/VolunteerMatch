// organizations_strip.dart
import 'package:flutter/material.dart';

import '../../../../../data/demo_data.dart';
import 'organization_card.dart';

class OrganizationsStrip extends StatelessWidget {
  const OrganizationsStrip({super.key, required this.orgs});
  final List<DemoOrg> orgs;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          for (int i = 0; i < orgs.length; i++) OrganizationCard(org: orgs[i]),
        ],
      ),
    );
  }
}
