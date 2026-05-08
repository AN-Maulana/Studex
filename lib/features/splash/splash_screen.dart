import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // --- Logika navigasi tetap dipertahankan ---
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black, // Background hitam sesuai gambar
      body: SafeArea(
        child: Center(
          child: Row( // Menggunakan Row agar sejajar horizontal seperti gambar
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Logo Asli Studex
              Image.asset(
                'assets/images/logo.png', // Pastikan path asset benar
                height: 60, // Sesuaikan ukuran logo
              )
              .animate()
              .fade(duration: 800.ms)
              .scale(delay: 200.ms),

              const SizedBox(width: 16), // Jarak antara logo dan teks

              // 2. Teks Studex
              Text(
                'Studex',
                style: AppTypography.boldTitle.copyWith(
                  color: AppColors.white,
                  fontSize: 40, // Ukuran teks disesuaikan agar proporsional
                ),
              )
              .animate()
              .fade(delay: 400.ms, duration: 800.ms),
            ],
          ),
        ),
      ),
    );
  }
}