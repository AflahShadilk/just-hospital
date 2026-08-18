import 'package:flutter/material.dart';

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
        child: imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return _buildPlaceholder();
                },
              )
            : _buildPlaceholder(),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: const Color(0xFFE9EEF5),
      child: const Center(
        child: Icon(
          Icons.local_hospital_outlined,
          size: 48,
          color: Color(0xFF8A94A6),
        ),
      ),
    );
  }
}