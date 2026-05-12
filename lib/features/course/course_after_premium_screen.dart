import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/constants/dummy_data.dart';
import 'course_detail.dart';

class CourseAfterPremiumScreen extends StatefulWidget {
  const CourseAfterPremiumScreen({super.key});

  @override
  State<CourseAfterPremiumScreen> createState() => _CourseAfterPremiumScreenState();
}

class _CourseAfterPremiumScreenState extends State<CourseAfterPremiumScreen> {
  // State untuk menyimpan status simpan
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    final course = DummyData.courseDetail;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
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
                  _buildTopicsList(context),
                  SizedBox(height: 16.h),
                  _buildReviews(),
                ],
              ),
            ),
            _buildFixedBottomButton(context),
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
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        // Update: Tombol Save dengan logika warna
        _buildCircleButton(
          isSaved ? Iconsax.archive_15 : Iconsax.archive_add,
          () {
            setState(() {
              isSaved = !isSaved;
            });
          },
          iconColor: isSaved ? Colors.white : Colors.black,
          bgColor: isSaved ? const Color(0xFF121212) : Colors.white,
        ),
      ],
    );
  }

  Widget _buildCircleButton(
    IconData icon, 
    VoidCallback onTap, {
    Color iconColor = Colors.black,
    Color bgColor = Colors.white,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20.sp, color: iconColor),
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
                  _buildTag(
                    "Math",
                    const Color(0xFFF9FBE7),
                    textColor: Colors.black,
                  ),
                  SizedBox(width: 8.w),
                  _buildTag(
                    "Science",
                    const Color(0xFFF9FBE7),
                    textColor: Colors.black,
                  ),
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
              fontWeight: FontWeight.w500,
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
                        style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black)),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 12, color: Color(0xFFF1B401)),
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
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '17 ',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'topics',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopicsList(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('All Topics', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black)),
                  Text('Improve your national insight and exam', style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey)),
                ],
              ),
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200, width: 2),
                ),
                alignment: Alignment.center,
                child: Text('0%', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12.sp)),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (context, index) => Divider(height: 32.h, color: Colors.grey.shade100),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CourseDetailScreen()),
                  );
                },
                borderRadius: BorderRadius.circular(12.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Row(
                    children: [
                      Container(
                        width: 44.w,
                        height: 44.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF8F8F8),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                        '0${index + 1}',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('TWK Practice Set', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black)),
                            Text('Improve your national insight and exam accuracy', 
                              style: GoogleFonts.poppins(fontSize: 11.sp, color: Colors.grey)),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 14.sp, color: Colors.black87),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20.h),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'View All',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFC4E839), 
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 16.sp,
                  color: const Color(0xFFC4E839),
                ),
              ],
            ),
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
              Text('Reviews ', style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.black)),
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
                          Text('Ethan Caldwell', style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w500, color: Colors.black)),
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
                  Row(children: List.generate(5, (i) => const Icon(Icons.star, size: 14, color: Color(0xFFF1B401)))),
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

  Widget _buildFixedBottomButton(BuildContext context) {
    return Positioned(
      bottom: 20.h,
      left: 20.w,
      right: 20.w,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CourseDetailScreen()),
          );
        },
        child: Container(
          height: 58.h,
          decoration: BoxDecoration(
            color: const Color(0xFF121212),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Try Now', 
                style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14.sp)),
              SizedBox(width: 12.w),
              const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(
    String text,
    Color bg, {
    IconData? icon,
    Color? textColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12.sp, color: textColor ?? Colors.black),
            SizedBox(width: 4.w),
          ],
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: textColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}