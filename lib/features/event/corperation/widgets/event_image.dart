import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class EventImage extends StatelessWidget {
  final String? photoUrl;

  const EventImage({super.key, this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: photoUrl != null
          ? Image.network(
              photoUrl!,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          : Container(
              height: 150,
              color: AppColors.forest.withOpacity(.08),
              alignment: Alignment.center,
              child: const Icon(
                Icons.image_outlined,
                size: 40,
                color: AppColors.forest,
              ),
            ),
    );
  }
}
