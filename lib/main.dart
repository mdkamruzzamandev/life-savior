import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const LifeSaviorApp());
}

class LifeSaviorApp extends StatelessWidget {
  const LifeSaviorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Savior',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00A651),
        ),

        scaffoldBackgroundColor: const Color(0xFFF4FFF8),

        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF00A651),
          foregroundColor: Colors.white,
          elevation: 0,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00A651),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 55),
          ),
        ),
      ),

      home: const SplashScreen(),
    );
  }
}