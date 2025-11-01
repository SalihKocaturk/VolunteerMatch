import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';
import '../models/user_model.dart';
import 'avatar_widget.dart';

class RankingHeader extends StatelessWidget {
  final String title;
  final List<UserModel> top3;

  const RankingHeader({super.key, required this.title, required this.top3});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _SoftWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.seed, AppColors.forest.withOpacity(.92)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
        child: Column(
          children: [
            // Üst bar: geri + başlık
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.white,
                    size: 22,
                  ),
                  tooltip: 'Geri',
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),

            // “Glass” şerit (estetik üst etiket)
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.white.withOpacity(.20),
                  width: 1,
                ),
                gradient: LinearGradient(
                  colors: [
                    AppColors.white.withOpacity(.28),
                    AppColors.white.withOpacity(.10),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'Top 3 Podium',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),

            // Podyum kartı (otomatik yükseklik)
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppColors.seed.withOpacity(.10),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.forest.withOpacity(.10),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _PodiumTile(
                    position: 2,
                    user: top3.length > 1 ? top3[1] : null,
                  ),
                  _PodiumTile(
                    position: 1,
                    user: top3.isNotEmpty ? top3[0] : null,
                    isBig: true,
                  ),
                  _PodiumTile(
                    position: 3,
                    user: top3.length > 2 ? top3[2] : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PodiumTile extends StatelessWidget {
  final int position; // 1,2,3
  final UserModel? user;
  final bool isBig;

  const _PodiumTile({
    required this.position,
    required this.user,
    this.isBig = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFirst = position == 1;
    final double avatarSize = isBig ? 66 : 56;

    // Bar yükseklikleri (AnimatedContainer ile yumuşak giriş)
    const double maxBar = 78;
    final double barHeight = isFirst
        ? maxBar
        : (position == 2 ? maxBar - 16 : maxBar - 26);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _CupIcon(filled: isFirst, size: isBig ? 30 : 26),
        const SizedBox(height: 8),
        AvatarWidget(
          name: user?.name ?? '-',
          imagePath: user?.imagePath,
          size: avatarSize,
        ),
        const SizedBox(height: 8),
        Text(
          user?.name ?? '—',
          style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.text),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        AnimatedContainer(
          duration: const Duration(milliseconds: 420),
          curve: Curves.easeOutCubic,
          width: 72,
          height: barHeight,
          decoration: BoxDecoration(
            color: AppColors.seed.withOpacity(.12),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.seed.withOpacity(.18),
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            '$position',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.seed,
            ),
          ),
        ),
      ],
    );
  }
}

// Güvenli animasyonlu kupa
class _CupIcon extends StatefulWidget {
  final double size;
  final bool filled;
  const _CupIcon({required this.size, required this.filled});

  @override
  State<_CupIcon> createState() => _CupIconState();
}

class _CupIconState extends State<_CupIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _scale = Tween(
      begin: 1.0,
      end: 1.06,
    ).animate(CurvedAnimation(parent: _c, curve: Curves.easeInOut));
    if (widget.filled) _c.repeat(reverse: true);
  }

  @override
  void deactivate() {
    if (_c.isAnimating) _c.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: widget.filled ? _scale : const AlwaysStoppedAnimation(1.0),
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: widget.filled
                ? [
                    AppColors.seed.withOpacity(.95),
                    AppColors.seed.withOpacity(.75),
                  ]
                : [
                    AppColors.seed.withOpacity(.14),
                    AppColors.seed.withOpacity(.08),
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: AppColors.seed.withOpacity(.18), width: 1),
        ),
        child: Icon(
          Icons.emoji_events_rounded,
          size: widget.size * .62,
          color: widget.filled
              ? AppColors.white
              : AppColors.forest.withOpacity(.85),
        ),
      ),
    );
  }
}

// Yumuşak dalga kesimi
class _SoftWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size s) {
    final p = Path()..lineTo(0, s.height - 24);
    p.quadraticBezierTo(s.width * .25, s.height, s.width * .5, s.height - 16);
    p.quadraticBezierTo(s.width * .75, s.height - 32, s.width, s.height - 12);
    p.lineTo(s.width, 0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(_) => false;
}
