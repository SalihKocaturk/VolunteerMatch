import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:prologue/core/constants/app_colors.dart';

enum SocialPlatform { instagram, twitter, linkedin, tiktok }

class SocialLinksRow extends StatelessWidget {
  const SocialLinksRow({super.key, required this.links});
  final Map<SocialPlatform, String> links;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 12,
      children: links.entries.map((e) {
        return _SocialPill(platform: e.key, url: e.value);
      }).toList(),
    );
  }
}

class _SocialPill extends StatelessWidget {
  const _SocialPill({required this.platform, required this.url});
  final SocialPlatform platform;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () async {
            final uri = Uri.parse(url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: _getPlatformImage(platform), // sadece görsel
          ),
        ),
        const SizedBox(height: 6),
        Text(
          _getPlatformLabel(platform),
          style: TextStyle(
            color: AppColors.darkBg.withOpacity(.75),
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _getPlatformImage(SocialPlatform platform) {
    switch (platform) {
      case SocialPlatform.instagram:
        return Image.asset(
          'assets/illustrations/insta_logo.jpg',
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        );
      case SocialPlatform.twitter:
        return Image.asset(
          'assets/illustrations/x_logo.png',
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        );
      case SocialPlatform.linkedin:
        return Image.asset(
          'assets/illustrations/linkedin_logo.png',
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        );
      case SocialPlatform.tiktok:
        return Image.asset(
          'assets/illustrations/tiktok_logo.png',
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        );
    }
  }

  String _getPlatformLabel(SocialPlatform platform) {
    switch (platform) {
      case SocialPlatform.instagram:
        return 'Instagram';
      case SocialPlatform.twitter:
        return 'X';
      case SocialPlatform.linkedin:
        return 'LinkedIn';
      case SocialPlatform.tiktok:
        return 'tiktok';
    }
  }
}
