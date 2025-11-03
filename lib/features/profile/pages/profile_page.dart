import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import 'package:prologue/core/navigation/debug_navigate.dart';
import 'package:prologue/features/profile/pages/edit_profile_page.dart';

import '../../../core/widgets/appbar/custom_app_bar.dart';
import '../models/user_level.dart';
import '../widgets/form_field_readonly.dart';
import '../widgets/profile_header_compact.dart';
import '../widgets/recent_activities_section.dart.dart';
import '../widgets/section_card.dart';
import '../widgets/social_links_row.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static const route = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _simulateRefresh() async {
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {}); // basit görsel refresh
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: AppColors.beige,
      appBar: CustomAppBar(
        title: "Profilim",
        actions: [
          IconButton(
            onPressed: () {
              NavHelper.push(context, const EditProfilePage());
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.seed,
          backgroundColor: AppColors.beige,
          strokeWidth: 2.5,
          displacement: 40,
          onRefresh: _simulateRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ProfileHeaderCard(
                  name: 'Kerem Ünal',
                  avatarUrl:
                      'https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?semt=ais_hybrid&w=740&q=80',
                  userLevel: UserLevel(xp: 2075),
                ),

                const SizedBox(height: 16),
                const SectionCard(
                  title: 'Sosyal Medya',
                  children: [
                    SocialLinksRow(
                      links: {
                        SocialPlatform.instagram:
                            'https://instagram.com/flutter',
                        SocialPlatform.twitter: 'https://x.com/flutterdev',
                        SocialPlatform.linkedin:
                            'https://linkedin.com/company/flutter-dev',
                        SocialPlatform.tiktok: 'https://tiktok.com/flutter',
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),
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
                  onItemTap: (item) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
