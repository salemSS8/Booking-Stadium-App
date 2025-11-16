import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screens/firstPage.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => UserProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // --- أضف هذا السطر لإزالة شريط DEBUG ---
      debugShowCheckedModeBanner: false,
      home: const SplashScreenWrapper(),
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  _SplashScreenWrapperState createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    // انتظر 3 ثواني في الشاشة الابتدائية
    await Future.delayed(const Duration(seconds: 3));

    // انتقل إلى الشاشات التعليمية
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Firstpage();
  }
}
