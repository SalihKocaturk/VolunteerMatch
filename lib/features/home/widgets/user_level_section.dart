import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class UserLevelSection extends StatelessWidget {
  const UserLevelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white),
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.seed,
                ),
                child: Column(
                  children: [
                    const Text(
                      'Bir sonraki seviyeye 207 puan kaldı!',
                      style: TextStyle(color: AppColors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const LinearProgressIndicator(
                          minHeight: 16,
                          value: 0.8,
                          backgroundColor: Color.fromARGB(255, 235, 207, 207),
                          color: AppColors.pink,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // SizedBox(
              //   width: 140,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       padding: const EdgeInsets.all(8),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(14),
              //       ),
              //       backgroundColor: AppColors.seed,
              //     ),
              //     onPressed: () {},
              //     child: const Text(
              //       'Daha Fazla',
              //       style: TextStyle(color: Colors.white, fontSize: 18),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
