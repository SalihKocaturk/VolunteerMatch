import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

import '../data/mock_users.dart';
import '../models/user_model.dart';

import '../widgets/ranking_header.dart';
import '../widgets/ranking_list.dart';
import '../widgets/your_rank_card.dart';
import '../widgets/ranking_filter.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  /// 0: Daily, 1: Weekly, 2: All
  int _filter = 2;

  List<UserModel> _sortedAll() {
    final list = [...mockUsers];
    list.sort((a, b) => b.score.compareTo(a.score));
    return list;
  }

  List<UserModel> _applyFilter(List<UserModel> all) {
    // Şimdilik demo: gerçek kaynağa bağlanınca burası ayrışır
    switch (_filter) {
      case 0: // Daily
        return all;
      case 1: // Weekly
        return all;
      default: // All
        return all;
    }
  }

  @override
  Widget build(BuildContext context) {
    final allUsers = _sortedAll();
    final filtered = _applyFilter(allUsers);

    // Podyum (1-2-3) + geri kalanı (4+)
    final top3 = filtered.take(3).toList();
    final rest = filtered.skip(3).toList();

    // Örnek: oturum kullanıcısı (u7)
    final you = allUsers.firstWhere(
      (u) => u.id == 'u7',
      orElse: () => allUsers.first,
    );
    final yourRank = allUsers.indexOf(you) + 1;
    final toNext = 1000 - (you.score % 1000);

    return Scaffold(
      backgroundColor: AppColors.beige,
      body: SafeArea(
        child: Column(
          children: [
            // Üst başlık ve podyum
            RankingHeader(title: 'Ranking', top3: top3),

            // Senin sıran kartı
            YourRankCard(user: you, rank: yourRank, toNext: toNext),

            // Bölüm başlığı (okunurluk)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Row(),
            ),

            // Zaman filtresi
            RankingFilter(
              index: _filter,
              onChanged: (i) => setState(() => _filter = i),
            ),

            // Liste (4’ten itibaren)
            Expanded(
              child: rest.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.park_outlined,
                          size: 48,
                          color: AppColors.forest,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'No rankings yet for this period',
                          style: TextStyle(
                            color: AppColors.text,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Join events to climb the board!',
                          style: TextStyle(
                            color: AppColors.forest.withOpacity(.8),
                          ),
                        ),
                      ],
                    )
                  : RankingList(users: rest, highlightUserId: you.id),
            ),
          ],
        ),
      ),
    );
  }
}

class _BouncyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  const _BouncyButton({required this.onPressed, required this.child});

  @override
  State<_BouncyButton> createState() => _BouncyButtonState();
}

class _BouncyButtonState extends State<_BouncyButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 120),
      scale: _pressed ? 0.98 : 1.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.seed,
          shape: const StadiumBorder(),
          elevation: 0,
          minimumSize: const Size.fromHeight(54),
        ),
        onPressed: () async {
          setState(() => _pressed = true);
          await Future.delayed(const Duration(milliseconds: 90));
          setState(() => _pressed = false);
          widget.onPressed();
        },
        child: widget.child,
      ),
    );
  }
}
