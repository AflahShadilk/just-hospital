import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorState extends StatelessWidget {
  final String message;

  const ErrorState({
    super.key,
    required this.message,
  });

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
              Icons.cloud_off_rounded,
              size: 56,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}