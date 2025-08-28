import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to login after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Get.offAllNamed(AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 255, 255, 255),
              const Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/splash.png',
            width: 600,
            height: 600,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              // Fallback if image fails to load
              return Container(
                width: 600,
                height: 600,
                decoration: BoxDecoration(
                  color: AppTheme.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.white.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.image,
                  size: 1000,
                  color: AppTheme.white,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
