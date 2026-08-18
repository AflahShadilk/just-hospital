import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        20,
        20,
        12,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Find a Hospital',
                  style: Get.textTheme.headlineMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'Find the right healthcare near you',
                  style: Get.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F1FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.local_hospital_outlined,
              color: Color(0xFF1565C0),
            ),
          ),
        ],
      ),
    );
  }
}