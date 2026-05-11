import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/constants/dummy_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_tag.dart';
import '../course/course_detail_screen.dart';
import 'course_before_premium_screen.dart';
import 'course_after_premium_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 20.h,
                bottom: 10.h,
              ),
              child: Text(
                'Search Your Learning Plan',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Iconsax.search_normal,
                            color: AppColors.textGrey,
                            size: 20.sp,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search your daily task',
                                hintStyle: GoogleFonts.poppins(
                                  color: AppColors.textGrey,
                                  fontSize: 14.sp,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    padding: EdgeInsets.all(14.w),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryLime,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Iconsax.setting_4,
                      color: AppColors.black,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  bottom: 100.h,
                ),
                itemCount: DummyData.recommendedCourses.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  final course = DummyData.recommendedCourses[index];
                  final isPremium =
                      index !=
                      0; // Assuming index != 0 is premium based on previous dummy logic
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => isPremium
                              ? const CourseAfterPremiumScreen()
                              : const CourseBeforePremiumScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomTag(
                                    text: 'Math',
                                    backgroundColor: AppColors.tagMathBg,
                                  ),
                                  SizedBox(width: 8.w),
                                  CustomTag(
                                    text: 'Science',
                                    backgroundColor: AppColors.tagScienceBg,
                                  ),
                                ],
                              ),
                              CustomTag(
                                text: index == 0 ? 'Free' : 'Premium',
                                backgroundColor: AppColors.tagPremiumBg,
                                textColor: AppColors.black,
                                icon: index == 0
                                    ? Iconsax.unlock
                                    : Iconsax.lock,
                              ),
                            ],
                          ),
                          // JARAK ATAS IMAGE (Diperkecil dari 16 ke 12 atau 10)
                          SizedBox(height: 12.h),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              20.r,
                            ), // Lebih round sesuai Figma
                            child: Image.asset(
                              course['image'],
                              height: 130
                                  .h, // Tinggi sedikit dikurangi agar proporsional
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // JARAK BAWAH IMAGE (Diperkecil agar teks menempel proporsional)
                          SizedBox(height: 12.h),
                          Text(
                            course['title'],
                            style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              height:
                                  1.2, // Mengatur line height agar tidak terlalu renggang
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            course['subtitle'],
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: AppColors.textGrey,
                            ),
                          ),
                          // JARAK MENUJU BOTTOM ROW
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Avatar Stack
                              SizedBox(
                                width: 70
                                    .w, // Dipersempit agar tidak memakan tempat
                                height: 32.h,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      child: CircleAvatar(
                                        radius: 14.r,
                                        backgroundImage: NetworkImage(
                                          course['studentAvatars'][0],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 18
                                          .w, // Jarak tumpukan (overlap) diperkecil
                                      child: CircleAvatar(
                                        radius: 14.r,
                                        backgroundImage: NetworkImage(
                                          course['studentAvatars'][1],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 36.w,
                                      child: CircleAvatar(
                                        radius: 14.r,
                                        backgroundColor:
                                            AppColors.iconBackground,
                                        child: Text(
                                          course['students'],
                                          style: GoogleFonts.poppins(
                                            fontSize: 9.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Button Learn Now
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.w,
                                  vertical: 12.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLime,
                                  borderRadius: BorderRadius.circular(25.r),
                                ),
                                child: Text(
                                  'Learn Now',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
