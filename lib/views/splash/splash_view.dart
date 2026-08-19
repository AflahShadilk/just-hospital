import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justhospital/core/app/routes/app_routes.dart';
import 'package:justhospital/core/app/theme/app_theme.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() =>
      _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    checkAuthentication();
  }

  void checkAuthentication() {
    Timer(
      const Duration(seconds: 2),
      () {
        if (!mounted) return;

        final user = _auth.currentUser;

        if (user != null) {
          Get.offNamed(AppRoutes.home);
        } else {
          Get.offNamed(AppRoutes.login);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(28),
                  ),
                  child: const Icon(
                    Icons.local_hospital_rounded,
                    size: 48,
                    color: AppTheme.primaryColor,
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  'Just Hospital',
                  style: theme.textTheme.headlineMedium
                      ?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Find the right healthcare near you',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(
                    color: Colors.white.withValues(
                      alpha: 0.85,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}