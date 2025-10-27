import 'package:flutter/material.dart';

class DemoEvent {
  final String title;
  final String location;
  final String date;
  final IconData icon;
  DemoEvent(this.title, this.location, this.date, this.icon);
}

class DemoOrg {
  final String name;
  final IconData icon;
  DemoOrg(this.name, this.icon);
}

final demoEvents = <DemoEvent>[
  DemoEvent(
    'Sahil Temizliği',
    'Kadıköy, Moda',
    'Cmt 10:00',
    Icons.beach_access,
  ),
  DemoEvent('Aşevi Dağıtımı', 'Beyoğlu', 'Paz 12:00', Icons.soup_kitchen),
  DemoEvent('Fidan Dikimi', 'Belgrad Ormanı', 'Paz 15:00', Icons.park),
];

final demoOrgs = <DemoOrg>[
  DemoOrg('LÖSEV', Icons.volunteer_activism),
  DemoOrg('TEMA', Icons.forest),
  DemoOrg('Kızılay', Icons.local_hospital),
  DemoOrg('AKUT', Icons.safety_check),
];
