import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
// import '../../../core/theme/app_colors.dart'; // Uncomment jika digunakan
// import '../../../core/theme/app_typography.dart'; // Uncomment jika digunakan
// import '../../../core/constants/app_constants.dart'; // Uncomment jika digunakan
import '../../../routes/app_routes.dart';

// Ubah menjadi StatefulWidget
class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  // State untuk mengontrol visibilitas password
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3), // Background abu-abu muda sesuai gambar
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            children: [
              // 1. Logo Studex Header (Di luar Card)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png', // Pastikan path benar
                    height: 80,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Studex',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      letterSpacing: -1.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // 2. White Card Container
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40), // Radius besar sesuai gambar
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri sesuai gambar
                  children: [
                    const Text(
                      'New Password',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Please enter your new password',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Label New Password
                    const Text(
                      'New Password',
                      style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      obscureText: _obscureNewPassword, // Gunakan state
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                        // Tambahkan InkWell atau IconButton pada suffixIcon
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureNewPassword 
                                ? Icons.visibility_off_outlined 
                                : Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            // Ubah state saat tombol ditekan
                            setState(() {
                              _obscureNewPassword = !_obscureNewPassword;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF3F3F3),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),

                    // Label Confirm Password
                    const Text(
                      'New Password', // Sesuai teks di gambar "New Password" diulang dua kali
                      style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      obscureText: _obscureConfirmPassword, // Gunakan state berbeda
                      decoration: InputDecoration(
                        hintText: 'Re-enter your new password',
                        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                        // Tambahkan InkWell atau IconButton pada suffixIcon
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword 
                                ? Icons.visibility_off_outlined 
                                : Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            // Ubah state saat tombol ditekan
                            setState(() {
                              _obscureConfirmPassword = !_obscureConfirmPassword;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF3F3F3),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // --- Logika Tombol Tetap Dipertahankan ---
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context, 
                            AppRoutes.login, 
                            (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD4F05B), // Lime Studex
                          foregroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: const Text(
                          'Save password',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Return to Login Link
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context, 
                            AppRoutes.login, 
                            (route) => false,
                          );
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: 'Return to ',
                            style: TextStyle(color: Colors.grey),
                            children: [
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  color: Color(0xFFD4F05B),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fade(duration: 600.ms).slideY(begin: 0.1, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}