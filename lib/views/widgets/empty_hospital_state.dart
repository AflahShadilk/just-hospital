import 'package:flutter/material.dart';
import 'package:justhospital/core/app/theme/app_theme.dart';

class EmptyHospitalState extends StatelessWidget {
  const EmptyHospitalState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppTheme.primaryLightColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.local_hospital_rounded,
                size: 38,
                color: AppTheme.primaryColor,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'No hospitals found',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge,
            ),

            const SizedBox(height: 8),

            Text(
              'We couldn’t find any hospitals matching your search.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),

            const SizedBox(height: 20),

            Text(
              'Try another hospital name or speciality.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}