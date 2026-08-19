import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justhospital/firebase_options.dart';

import 'core/app/routes/app_routes.dart';
import 'core/app/theme/app_theme.dart';
import 'controllers/hospital_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(HospitalController());

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
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.pages,
    );
  }
}