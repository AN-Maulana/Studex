import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/theme/app_colors.dart';
import '../home/home_screen.dart';
import '../search/search_screen.dart';
// --- TAMBAHKAN IMPORT INI ---
import '../coaching/coaching_screen.dart'; 
import '../profile/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  // --- UPDATE LIST SCREENS DI SINI ---
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CoachingScreen(), // Ganti teks Center sebelumnya dengan kelas ini
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, 
      backgroundColor: AppColors.background,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 25.h),
        height: 75.h, 
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(40.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.r),
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
            selectedLabelStyle: GoogleFonts.poppins(
              fontSize: 10.sp, 
              fontWeight: FontWeight.w500,
              height: 1.5, 
            ),
            unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 10.sp, 
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
            items: [
              const BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Iconsax.home),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Iconsax.home5),
                ),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Iconsax.book),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Iconsax.book_15),
                ),
                label: 'Course',
              ),
              const BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Iconsax.video_play),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Iconsax.video_play5),
                ),
                label: 'Coaching',
              ),
              const BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Iconsax.user),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Iconsax.user_square5),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}