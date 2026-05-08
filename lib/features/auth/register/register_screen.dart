import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/social_button.dart';
import '../../../routes/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _agreeToTerms = false;

  // --- Logika tetap dipertahankan ---
  void _handleRegister() {
    if (!_agreeToTerms) return; 
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _buildSuccessPopup(),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context); 
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    });
  }

  Widget _buildSuccessPopup() {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFFD4F05B), // Warna lime sesuai gambar
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.black, size: 40),
            ),
            const SizedBox(height: 24),
            Text(
              'Successfully Register!',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF3F3F3), 
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          children: [
            // 1. Logo Studex Header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Menggunakan baseline atau center agar teks duduk manis di samping logo
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 80, 
                ),
                const SizedBox(width: 8), // Jarak dirapatkan sedikit agar mirip gambar
                const Text(
                  'Studex',
                  style: TextStyle(
                    fontSize: 32, // Ukuran diperbesar sedikit agar seimbang dengan logo besar
                    fontWeight: FontWeight.w900, // Menggunakan w900 untuk ketebalan maksimal (Extra Bold)
                    color: Colors.black,
                    letterSpacing: -0.5, // Merapatkan huruf sedikit agar terlihat lebih solid
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

              // 2. Main Card
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40), // Radius besar sesuai gambar
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Username Field
                    const Text('Username', style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    _buildTextField(hint: 'Enter your username'),

                    const SizedBox(height: 20),

                    // Email Field
                    const Text('Email', style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    _buildTextField(hint: 'Enter your email address', type: TextInputType.emailAddress),

                    const SizedBox(height: 20),

                    // Password Field
                    const Text('Password', style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    _buildTextField(hint: 'Enter your password', isPassword: true),

                    const SizedBox(height: 16),

                    // Terms and Conditions
                    Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: _agreeToTerms,
                            onChanged: (value) => setState(() => _agreeToTerms = value ?? false),
                            activeColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: 'I agree to the ',
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: 'Terms or Service',
                                  style: TextStyle(color: Color(0xFFD4F05B), fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _handleRegister,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD4F05B), // Lime color
                          foregroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                        ),
                        child: const Text('Sign Up', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Social Login Divider
                    const Center(
                      child: Text('Or Sign in with', style: TextStyle(color: Colors.grey)),
                    ),
                    const SizedBox(height: 24),

                    // Social Buttons Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialIcon(Icons.facebook, Colors.blue),
                        const SizedBox(width: 20),
                        _socialIcon(Icons.g_mobiledata, Colors.red, isGoogle: true),
                        const SizedBox(width: 20),
                        _socialIcon(Icons.apple, Colors.black),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Footer Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? ", style: TextStyle(color: Colors.grey)),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: Color(0xFFD4F05B), fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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

  // Widget pembantu untuk TextField agar konsisten dengan gambar
  Widget _buildTextField({required String hint, bool isPassword = false, TextInputType? type}) {
    return TextField(
      obscureText: isPassword,
      keyboardType: type,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        filled: true,
        fillColor: const Color(0xFFF3F3F3),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        suffixIcon: isPassword ? const Icon(Iconsax.eye_slash, color: Colors.grey, size: 20) : null,
      ),
    );
  }

  // Widget pembantu untuk tombol sosial
  Widget _socialIcon(IconData icon, Color color, {bool isGoogle = false}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 30),
    );
  }
}