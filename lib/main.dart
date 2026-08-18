import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/theme/app_theme.dart';
import 'app/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
                'JustDial Hospital',
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