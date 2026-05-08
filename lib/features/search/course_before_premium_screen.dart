import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/constants/dummy_data.dart';
import '../../core/theme/app_colors.dart';

class CourseBeforePremiumScreen extends StatelessWidget {
  const CourseBeforePremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final course = DummyData.courseDetail;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light gray background
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h, bottom: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  SizedBox(height: 20.h),
                  _buildCourseHero(course),
                  SizedBox(height: 16.h),
                  _buildTopicsList(),
                  SizedBox(height: 16.h),
                  _buildReviews(),
                ],
              ),
            ),
            
            // Fixed bottom button "Join Premium"
            _buildFixedBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCircleButton(Iconsax.arrow_left, () => Navigator.pop(context)),
        Text(
          'Topics',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        _buildCircleButton(Iconsax.bookmark, () {}),
      ],
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20.sp, color: Colors.black),
      ),
    );
  }

  Widget _buildCourseHero(Map<String, dynamic> course) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.network(
              'https://picsum.photos/seed/fishing/400/200',
              height: 180.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildTag("Math", const Color(0xFFF9FBE7)),
                  SizedBox(width: 8.w),
                  _buildTag("Science", const Color(0xFFF9FBE7)),
                ],
              ),
              _buildTag("Premium", Colors.grey.shade100, icon: Iconsax.lock),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            course['title'] ?? 'Marine & Fisheries',
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            course['subtitle'] ?? 'Learn technical roles and supervision in the marine and fisheries sector',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18.r,
                    backgroundImage: NetworkImage(course['instructorAvatar'] ?? 'https://i.pravatar.cc/150?img=11'),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course['instructor'] ?? 'Damar Firdauzi, S.Pi', 
                        style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w600)),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 12, color: Colors.orange),
                          Text(' 4.9 (1.972 Reviews)', 
                            style: GoogleFonts.poppins(fontSize: 10.sp, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text('17 topics', style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopicsList() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('All Topics', style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold)),
          Text('Improve your national insight and exam', style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey)),
          SizedBox(height: 20.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (context, index) => Divider(height: 32.h, color: Colors.grey.shade100),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8F8F8),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text('0${index + 1}', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('TWK Practice Set', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600)),
                        Text('Improve your national insight and exam accuracy', 
                          style: GoogleFonts.poppins(fontSize: 11.sp, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Icon(Iconsax.lock, size: 20.sp, color: Colors.grey.shade400),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReviews() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Reviews ', style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              Text('(192)', style: GoogleFonts.poppins(fontSize: 16.sp, color: Colors.grey)),
            ],
          ),
          Text('Improve your national insight and exam', style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey)),
          SizedBox(height: 20.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (context, index) => Divider(height: 32.h, color: Colors.grey.shade100),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(radius: 14.r, backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=5')),
                          SizedBox(width: 10.w),
                          Text('Ethan Caldwell', style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('0 ', style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey)),
                          const Icon(Icons.thumb_up_outlined, size: 14, color: Colors.grey),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(children: List.generate(5, (i) => const Icon(Icons.star, size: 14, color: Colors.orange))),
                  SizedBox(height: 8.h),
                  Text(
                    '"The lessons are very clear and focused on CPNS topics. The practice sets really helped me improve my score."',
                    style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey, height: 1.4),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFixedBottomButton() {
    return Positioned(
      bottom: 20.h,
      left: 20.w,
      right: 20.w,
      child: Container(
        height: 58.h,
        decoration: BoxDecoration(
          color: const Color(0xFF121212),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Join Premium', 
              style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14.sp)),
            SizedBox(width: 12.w),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text, Color bg, {IconData? icon}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          if (icon != null) ...[Icon(icon, size: 12.sp), SizedBox(width: 4.w)],
          Text(text, style: GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
