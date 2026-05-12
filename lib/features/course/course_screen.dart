import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/constants/dummy_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_tag.dart';
import 'course_after_premium_screen.dart';
import 'course_before_premium_screen.dart';
import 'course_detail_screen.dart';

enum CourseAccessFilter {
  all,
  free,
  premium,
}

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final TextEditingController _searchController = TextEditingController();
  CourseAccessFilter _filter = CourseAccessFilter.all;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    // Only rebuild; no heavy work.
    setState(() {});
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  bool _isPremiumByIndex(int index) {
    // Logic yang dipakai di code lama: index != 0 => premium
    return index != 0;
  }

  bool _matchesFilter(int index) {
    final isPremium = _isPremiumByIndex(index);
    switch (_filter) {
      case CourseAccessFilter.all:
        return true;
      case CourseAccessFilter.free:
        return !isPremium;
      case CourseAccessFilter.premium:
        return isPremium;
    }
  }

  bool _matchesSearch(Map<String, dynamic> course) {
    final q = _searchController.text.trim().toLowerCase();
    if (q.isEmpty) return true;

    final title = (course['title'] ?? '').toString().toLowerCase();
    final subtitle = (course['subtitle'] ?? '').toString().toLowerCase();
    return title.contains(q) || subtitle.contains(q);
  }

  List<Map<String, dynamic>> _getFilteredCourses() {
    final all = DummyData.recommendedCourses;
    final results = <Map<String, dynamic>>[];

    for (var i = 0; i < all.length; i++) {
      final course = all[i];
      if (!_matchesFilter(i)) continue;
      if (!_matchesSearch(course)) continue;
      results.add(course);
    }

    return results;
  }

  Future<void> _openFilterSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        Widget option({
          required String title,
          required String subtitle,
          required CourseAccessFilter value,
        }) {
          final selected = _filter == value;
          return InkWell(
            borderRadius: BorderRadius.circular(16.r),
            onTap: () {
              setState(() => _filter = value);
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: selected ? AppColors.primaryLime : AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: selected ? AppColors.primaryLime : AppColors.textGrey,
                    width: 1.2,
                  ),
              ),
              child: Row(
                children: [
                  Icon(
                    selected ? Iconsax.tick_circle : Iconsax.info_circle,
                    size: 20.sp,
                    color: selected ? AppColors.black : AppColors.textGrey,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: selected ? AppColors.black : AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filter',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 8.h),
                option(
                  title: 'All',
                  subtitle: 'Semua course',
                  value: CourseAccessFilter.all,
                ),
                option(
                  title: 'Free',
                  subtitle: 'Hanya course free',
                  value: CourseAccessFilter.free,
                ),
                option(
                  title: 'Premium',
                  subtitle: 'Hanya course premium',
                  value: CourseAccessFilter.premium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredCourses = _getFilteredCourses();

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
                  fontWeight: FontWeight.w500,
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
                              controller: _searchController,
                              textInputAction: TextInputAction.search,
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              onSubmitted: (_) {
                                FocusScope.of(context).unfocus();
                              },
                              decoration: InputDecoration(
                                hintText: 'Search your daily task',
                                hintStyle: GoogleFonts.poppins(
                                  color: AppColors.textGrey,
                                  fontSize: 15.sp,
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
                  GestureDetector(
                    onTap: _openFilterSheet,
                    child: Container(
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(

              child: filteredCourses.isEmpty
                  ? Center(
                      child: Text(
                        'No courses found',
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textGrey,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        bottom: 100.h,
                      ),
                      itemCount: filteredCourses.length,
                      separatorBuilder: (context, index) => SizedBox(height: 16.h),
                      itemBuilder: (context, index) {
                        // Karena daftar sudah difilter, index di sini tidak sama dengan index asli.
                        // Jadi kita tentukan premium/free berdasarkan key dari data dummy.
                        // Kita pakai fallback: cari course di list dummy untuk mendapatkan index asli.
                        final course = filteredCourses[index];
                        final originalIndex = DummyData.recommendedCourses.indexWhere(
                          (e) => e['title'] == course['title'] && e['subtitle'] == course['subtitle'],
                        );
                        final isPremium = originalIndex == -1
                            ? false
                            : _isPremiumByIndex(originalIndex);

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
                                      text: isPremium ? 'Premium' : 'Free',
                                      backgroundColor: AppColors.tagPremiumBg,
                                      textColor: AppColors.black,
                                      icon: isPremium ? Iconsax.lock : Iconsax.unlock,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.h),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: Image.asset(
                                    course['image'],
                                    height: 130.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  course['title'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                    height: 1.2,
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
                                SizedBox(height: 12.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 70.w,
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
                                            left: 18.w,
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
                                              backgroundColor: AppColors.iconBackground,
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
                                          fontWeight: FontWeight.w500,
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