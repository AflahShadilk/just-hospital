import 'package:flutter/material.dart';
import 'package:justhospital/core/app/theme/app_theme.dart';

class HospitalImage extends StatelessWidget {
  final String imageUrl;

  const HospitalImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(18),
      ),
      child: AspectRatio(
        aspectRatio: 16 / 8,
        child: imageUrl.trim().isEmpty
            ? placeholderBuld()
            : imageUrl.startsWith('assets/')
                ? Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return placeholderBuld();
                    },
                  )
                : Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (
                      context,
                      child,
                      loadingProgress,
                    ) {
                      if (loadingProgress == null) {
                        return child;
                      }

                      return loadingState(
                        loadingProgress,
                      );
                    },
                    errorBuilder: (_, __, ___) {
                      return placeholderBuld();
                    },
                  ),
      ),
    );
  }

  Widget loadingState(
    ImageChunkEvent loadingProgress,
  ) {
    final expectedTotal =
        loadingProgress.expectedTotalBytes;

    final loadedBytes =
        loadingProgress.cumulativeBytesLoaded;

    final progress = expectedTotal != null
        ? loadedBytes / expectedTotal
        : null;

    return Container(
      color: AppTheme.primaryLightColor,
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 2.5,
            color: AppTheme.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget placeholderBuld() {
    return Container(
      color: const Color(0xFFEFF3F8),
      child: Center(
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Icon(
            Icons.local_hospital_rounded,
            size: 34,
            color: AppTheme.primaryColor,
          ),
        ),
      ),
    );
  }
}