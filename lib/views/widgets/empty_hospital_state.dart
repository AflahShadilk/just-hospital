import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyHospitalState extends StatelessWidget {
  const EmptyHospitalState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.local_hospital_outlined,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              'No hospitals found',
              style: Get.textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Try searching with another hospital name or speciality.',
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}