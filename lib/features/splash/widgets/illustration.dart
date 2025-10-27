import 'package:flutter/material.dart';

class Illustration extends StatelessWidget {
  const Illustration({
    super.key,
    required this.assetPath,
    this.height,
    this.semanticLabel,
    this.cacheWidth,
  });

  final String assetPath;
  final double? height;
  final String? semanticLabel;

  final int? cacheWidth;

  @override
  Widget build(BuildContext context) {
    final img = AssetImage(assetPath);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(img, context);
    });

    return ExcludeSemantics(
      excluding: semanticLabel == null,
      child: Semantics(
        label: semanticLabel,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image(
            image: img,
            height: height,
            fit: BoxFit.cover,
            gaplessPlayback: true,
            filterQuality: FilterQuality.medium,
          ),
        ),
      ),
    );
  }
}
