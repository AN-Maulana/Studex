import 'package:flutter/material.dart';

import '../features/splash/splash_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/auth/login/login_screen.dart';
import '../features/auth/register/register_screen.dart';
import '../features/auth/forgot_password/forgot_password_screen.dart';
import '../features/auth/otp/verify_otp_screen.dart';
import '../features/auth/forgot_password/create_new_password_screen.dart';
import '../features/main_layout/main_layout_screen.dart';
import '../features/course/course_detail_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String verifyOtp = '/verify-otp';
  static const String createNewPassword = '/create-new-password';
  static const String mainLayout = '/main-layout';
  static const String courseDetail = '/course-detail';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      onboarding: (context) => const OnboardingScreen(),
      login: (context) => const LoginScreen(),
      register: (context) => const RegisterScreen(),
      forgotPassword: (context) => const ForgotPasswordScreen(),
      verifyOtp: (context) => const VerifyOtpScreen(),
      createNewPassword: (context) => const CreateNewPasswordScreen(),
      mainLayout: (context) => const MainLayoutScreen(),
      courseDetail: (context) => const CourseDetailScreen(),
    };
  }
}
