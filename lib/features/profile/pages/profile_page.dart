import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

import '../models/user_level.dart';
import '../widgets/edit_profile_button.dart';
import '../widgets/form_field_readonly.dart';
import '../widgets/profile_header_compact.dart';
import '../widgets/recent_activities_section.dart.dart';
import '../widgets/section_card.dart';
import '../widgets/social_links_row.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const route = '/profile';

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.darkBg),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'Profilim',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded, color: AppColors.darkBg),
            tooltip: 'Ayarlar',
            onPressed: () {},
          ),
          const SizedBox(width: 4),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 🔹 Profil + Seviye Barı
              const ProfileHeaderCard(
                name: 'Kerem Ünal',
                avatarUrl: 'https://i.pravatar.cc/200?img=15',
                userLevel: UserLevel(
                  xp: 120,
                ), // 2. seviye %40 her 100 XP = 1 seviye yani 220 XP = seviye 2 ve %20 ilerleme
              ),

              const SizedBox(height: 16),
              const SectionCard(
                title: 'Sosyal Medya',
                children: [
                  SocialLinksRow(
                    links: {
                      SocialPlatform.instagram: 'https://instagram.com/flutter',
                      SocialPlatform.twitter: 'https://x.com/flutterdev',
                      SocialPlatform.linkedin:
                          'https://linkedin.com/company/flutter-dev',
                      SocialPlatform.tiktok: 'https://tiktok.com/flutter',
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // 🔹 Hakkında kısmı
              SectionCard(
                title: 'Hakkında',
                children: const [
                  FormFieldReadonly(
                    label: '',
                    value:
                        'Teknolojiye, gönüllülüğe ve doğa projelerine ilgi duyan bir katılımcı...',
                    maxLines: 4,
                    icon: Icons.info_outline_rounded,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 🔹 Kişisel Bilgiler
              SectionCard(
                title: 'Kişisel Bilgiler',
                children: const [
                  FormFieldReadonly(
                    label: 'Yaş',
                    value: '23',
                    icon: Icons.cake_rounded,
                  ),
                  FormFieldReadonly(
                    label: 'Şehir',
                    value: 'Kocaeli',
                    icon: Icons.location_city_rounded,
                  ),
                  FormFieldReadonly(
                    label: 'Adres',
                    value: 'İzmit / Kocaeli',
                    maxLines: 2,
                    icon: Icons.home_rounded,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              RecentActivitiesSection(
                items: const [
                  ActivityItem(
                    title: 'Kıyı Temizliği',
                    dateText: '12 Ekim 2025',
                    xp: 20,
                  ),
                  ActivityItem(
                    title: 'Kitap Bağışı',
                    dateText: '05 Ekim 2025',
                    xp: 10,
                  ),
                ],
                onItemTap: (item) {
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => ActivityDetailPage(item: item)));
                },
              ),

              const SizedBox(height: 16),

              // 🔹 Sosyal Medya
              const SizedBox(height: 24),

              // 🔹 Profili Düzenle butonu
              EditProfileButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EditProfilePage()),
                  );
                },
              ),

              const SizedBox(height: 8),

              Text(
                'Bu sayfa sadece görüntüleme içindir. Güncellemeler “Profili Düzenle” kısmından yapılabilir.',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityTile extends StatelessWidget {
  final String title, date;
  final int xp;
  const ActivityTile({
    super.key,
    required this.title,
    required this.date,
    required this.xp,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: AppColors.green,
        child: Text(xp.toString(), style: const TextStyle(color: Colors.white)),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(date),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {},
    );
  }
}
