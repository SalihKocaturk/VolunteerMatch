import '../../fyp/models/activity.dart';

final activities = [
  Activity(
    id: '1',
    title: 'Yardım Etkinliği',
    description: 'Yaşlı bakım merkezinde bağış toplamaya yardım etkinliği.',
    location: 'Kadıköy, İstanbul',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/3/3d/Charity_shop.jpg',
    date: DateTime(2025, 11, 17),
    points: 60,
  ),
  Activity(
    id: '2',
    title: 'Arkadaş Ziyareti',
    description: 'Yaşılara arkadaşlık etmek için ziyaret. etkinliği',
    location: 'Bakırköy / İstanbul',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/1/1e/Old_people_visiting.jpg',
    date: DateTime(2025, 11, 18),
    points: 50,
  ),
];
