import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../course/course_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
            bottom: 100.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 25.h),
              _buildLearningInProgress(),
              SizedBox(height: 25.h),
              _buildRecommended(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundImage: const NetworkImage(
                'https://i.pravatar.cc/150?img=11',
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jack Smith Loren',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Icon(Iconsax.grammerly, size: 14.sp, color: Colors.grey),
                      SizedBox(width: 4.w),
                      Text(
                        '1.862',
                        style: GoogleFonts.poppins(
                          fontSize: 11.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        // FUNGSI NOTIFIKASI
        IconButton(
          onPressed: () => _showNotificationSheet(context),
          icon: Container(
            padding: EdgeInsets.all(10.w),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(Iconsax.notification, size: 20.sp, color: Colors.black),
          ),
        ),
      ],
    );
  }

  // MODAL POP UP NOTIFIKASI
  void _showNotificationSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(24.w),
        height: 400.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifications',
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFFD4F05B),
                    child: Icon(Iconsax.info_circle, size: 20.sp, color: Colors.black),
                  ),
                  title: Text(
                    'Update Course!',
                    style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'New practice set for TWK is now available.',
                    style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearningInProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Learning In Progress',
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            // HOVER & KLIK PADA SEE ALL
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LearningProgressScreen()),
                );
              },
              borderRadius: BorderRadius.circular(8.r),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Text(
                  'See all',
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 195.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            separatorBuilder: (_, __) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              return _buildProgressCard(width: 280.w);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProgressCard({double? width}) {
    return Container(
      width: width,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(Iconsax.book, size: 20.sp),
              ),
              _buildProgressIndicator(65),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'TWK Practice Set',
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Text(
            'Improve your national insight and exam accuracy',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 11.sp,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 14.r,
                      backgroundImage: const NetworkImage(
                        'https://i.pravatar.cc/150?img=12',
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Damar Firdauzi, S.Pi',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, size: 12, color: Color(0xFFF1B401)),
                              Text(
                                ' 4.9 (1.972 Reviews)',
                                style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: const BoxDecoration(
                  color: Color(0xFFD4F05B),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_outward, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecommended() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended for you',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          separatorBuilder: (_, __) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            bool isHovered = hoveredIndex == index;

            return MouseRegion(
              onEnter: (_) => setState(() => hoveredIndex = index),
              onExit: (_) => setState(() => hoveredIndex = null),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: isHovered ? const Color(0xFF1A1A1A) : Colors.white,
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
                            _buildBadge("Math", const Color(0xFFF2F9CC), Colors.black),
                            SizedBox(width: 8.w),
                            _buildBadge("Science", const Color(0xFFF2F9CC), Colors.black),
                          ],
                        ),
                        _buildBadge(
                          "Premium",
                          isHovered ? Colors.white12 : Colors.grey.shade100,
                          isHovered ? Colors.white : Colors.black,
                          icon: Iconsax.lock,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.network(
                        'https://picsum.photos/seed/${index + 5}/400/200',
                        height: 140.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'TWK Practice Set',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: isHovered ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      'Improve your national insight and exam accuracy',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: isHovered ? Colors.white70 : Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildOverlapUsers(isHovered),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD4F05B),
                            foregroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                          ),
                          child: Text(
                            'Learn Now',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
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
      ],
    );
  }

  Widget _buildProgressIndicator(int percent) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 40.w,
          height: 40.w,
          child: CircularProgressIndicator(
            value: percent / 100,
            strokeWidth: 4,
            backgroundColor: Colors.grey.shade200,
            color: const Color(0xFFD4F05B),
          ),
        ),
        Text(
          '$percent%',
          style: GoogleFonts.poppins(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildBadge(String text, Color bg, Color textCol, {IconData? icon}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12.sp, color: textCol),
            SizedBox(width: 4.w),
          ],
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: textCol,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverlapUsers(bool isDark) {
    return SizedBox(
      width: 80.w,
      height: 32.h,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: CircleAvatar(
              radius: 16.r,
              backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=1'),
            ),
          ),
          Positioned(
            left: 20.w,
            child: CircleAvatar(
              radius: 16.r,
              backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=2'),
            ),
          ),
          Positioned(
            left: 40.w,
            child: CircleAvatar(
              radius: 16.r,
              backgroundColor: isDark ? Colors.white24 : Colors.grey.shade200,
              child: Text(
                '99+',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: isDark ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// HALAMAN SEE ALL (Lengkap)
class LearningProgressScreen extends StatelessWidget {
  const LearningProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Learning In Progress",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20.w),
        itemCount: 5,
        separatorBuilder: (_, __) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          // Akses widget kartu dari state HomeScreen
          return _HomeScreenState()._buildProgressCard();
        },
      ),
    );
  }
}