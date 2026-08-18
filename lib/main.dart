import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_routes.dart';
import 'app/theme/app_theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const JustDialHospitalApp());
}

class JustDialHospitalApp extends StatelessWidget {
  const JustDialHospitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'JustDial Hospital',

      theme: AppTheme.lightTheme,

      initialRoute: AppRoutes.home,

      getPages: [
        GetPage(
          name: AppRoutes.home,
          page: () => const Scaffold(
            body: Center(
              child: Text(
                'Firebase Connected',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}