import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

import '../data/mock_users.dart';
import '../models/user_model.dart';
import '../widgets/ranking_filter.dart';
import '../widgets/ranking_header.dart';
import '../widgets/ranking_list.dart';
import '../widgets/your_rank_card.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  int _filtre = 2;

  Future<void> _simulateRefresh() async {
    // Kaydırarak yenileme efekti
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {});
  }

  List<UserModel> _siraliTumKullanicilar() {
    final liste = [...mockUsers];
    liste.sort((a, b) => b.score.compareTo(a.score));
    return liste;
  }

  List<UserModel> _filtreUygula(List<UserModel> tum) {
    switch (_filtre) {
      case 0:
        return tum;
      case 1:
        return tum;
      default:
        return tum;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tumKullanicilar = _siraliTumKullanicilar();
    final filtreli = _filtreUygula(tumKullanicilar);

    final ilk3 = filtreli.take(3).toList();
    final digerleri = filtreli.skip(3).toList();

    final sen = tumKullanicilar.firstWhere(
      (u) => u.id == 'u7',
      orElse: () => tumKullanicilar.first,
    );
    final seninSiran = tumKullanicilar.indexOf(sen) + 1;
    final sonrakiHedef = 1000 - (sen.score % 1000);

    return Scaffold(
      backgroundColor: AppColors.beige,
      body: RefreshIndicator(
        color: AppColors.seed,
        backgroundColor: AppColors.beige,
        strokeWidth: 2.5,
        onRefresh: _simulateRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              RankingHeader(title: 'Sıralama', top3: ilk3),
              YourRankCard(user: sen, rank: seninSiran, toNext: sonrakiHedef),

              const SizedBox(height: 10),

              RankingFilter(
                index: _filtre,
                onChanged: (i) => setState(() => _filtre = i),
              ),

              // Liste (4. sıradan itibaren)
              digerleri.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.emoji_events_outlined,
                            size: 48,
                            color: AppColors.forest,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Bu dönem için sıralama bulunamadı',
                            style: TextStyle(
                              color: AppColors.text,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Etkinliklere katılarak sıralamada yüksel!',
                            style: TextStyle(
                              color: AppColors.forest.withOpacity(.8),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: RankingList(
                        users: digerleri,
                        highlightUserId: sen.id,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
