import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../home/home_screen.dart';
import '../course/course_screen.dart';
import '../coaching/coaching_screen.dart'; 
import '../profile/profile_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    const HomeScreen(),
    const CourseScreen(),
    const CoachingScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false agar tidak overflow saat keyboard muncul
      resizeToAvoidBottomInset: false,
      extendBody: true, 
      backgroundColor: AppColors.background,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Padding(
      // Menggunakan SafeArea agar aman di HP berponi/full screen
      padding: EdgeInsets.only(bottom: 20.h), 
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        height: 68.h, // Tinggi sedikit dikurangi agar lebih proporsional & aman dari overflow
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(35.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35.r),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              _pageController.jumpToPage(index);
            },
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.textGrey.withOpacity(0.5),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            // Menggunakan Poppins w400 (Regular) sesuai spek Figma sebelumnya
            selectedLabelStyle: GoogleFonts.poppins(
              fontSize: 9.sp, 
              fontWeight: FontWeight.w500, // Medium untuk item terpilih
              letterSpacing: -0.32,
            ),
            unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 9.sp, 
              fontWeight: FontWeight.w400, // Regular (400)
              letterSpacing: -0.32,
            ),
            items: [

              _buildNavItem(Iconsax.home, Iconsax.home5, 'Home'),
              _buildNavItem(Iconsax.book, Iconsax.book_15, 'Course'),
              _buildNavItem(Iconsax.video_play, Iconsax.video_play5, 'Coaching'),
              _buildNavItem(Iconsax.user, Iconsax.user_square5, 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, IconData activeIcon, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 4.h),
        child: Icon(icon, size: 20.sp),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.only(bottom: 4.h),
        child: Icon(activeIcon, size: 20.sp),
      ),
      label: label,
    );
  }
}