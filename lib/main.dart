import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/helper/notifications.dart';
import 'package:parking_app/onBordingScreens/splashScareen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ParkingApp());
  LocalNotificationService.init();
}

class ParkingApp extends StatelessWidget {
  const ParkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
