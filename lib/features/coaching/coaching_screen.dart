import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'coaching_detail_screen.dart';
import 'coaching_detail_enrolnow.dart';

class CoachingScreen extends StatefulWidget {
  const CoachingScreen({super.key});

  @override
  State<CoachingScreen> createState() => _CoachingScreenState();
}

class _CoachingScreenState extends State<CoachingScreen> {
  DateTime selectedDate = DateTime.now();

  // Fungsi untuk mendapatkan jumlah hari dalam bulan yang dipilih
  int _getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFDDF247),
              onPrimary: Colors.black,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan jumlah hari untuk bulan yang sedang dipilih
    final int daysCount = _getDaysInMonth(selectedDate.year, selectedDate.month);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            Container(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Coaching',
                        style: GoogleFonts.poppins(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _selectDateFromPicker(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today_rounded, size: 16.sp),
                              SizedBox(width: 6.w),
                              Text(
                                DateFormat('MMM yyyy').format(selectedDate),
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  _buildSearchBar(),
                  SizedBox(height: 20.h),

                  /// HORIZONTAL DATE LIST (Menyesuaikan dengan Bulan Kalender)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(daysCount, (index) {
                        // Membuat tanggal dari 1 sampai akhir bulan
                        DateTime dayToShow = DateTime(selectedDate.year, selectedDate.month, index + 1); 
                        
                        bool isSelected = dayToShow.year == selectedDate.year &&
                                          dayToShow.month == selectedDate.month &&
                                          dayToShow.day == selectedDate.day;

                        return _buildDateItem(
                          DateFormat('E').format(dayToShow),
                          dayToShow.day.toString(),
                          isActive: isSelected,
                          onTap: () {
                            setState(() {
                              selectedDate = dayToShow;
                            });
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            /// CONTENT
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today Coaching',
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildCoachingCard(context),
                    SizedBox(height: 20.h),
                    _buildInstructorCard(context),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey, size: 22.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your daily task',
                hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 13.sp),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateItem(
    String day,
    String date, {
    bool isActive = false,
    bool hasUpdate = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 62.w,
        margin: EdgeInsets.only(right: 12.w),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          border: isActive ? Border.all(color: Colors.black.withOpacity(0.05)) : null,
        ),
        child: Column(
          children: [
            Text(
              day,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: isActive ? Colors.black : Colors.grey,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: 38.w,
              height: 38.w,
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFFDDF247) : const Color(0xFFF4F4F4),
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: Colors.black,
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

  Widget _buildCoachingCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22.r),
              child: Image.network(
                'https://images.unsplash.com/photo-1517048676732-d65bc937f952?q=80&w=1000&auto=format&fit=crop',
                height: 160.h, width: double.infinity, fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 14.h),
            Text('Strategies to Ace the CPNS Exam', style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w600)),
            SizedBox(height: 10.h),
            _buildBulletPoint('Tips for TWK, TIU, TKP'),
            _buildBulletPoint('Live Q&A session'),
            SizedBox(height: 18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Today • 8:00 AM', style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500)),
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CoachingDetailScreen())),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFDDF247), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r))),
                  child: const Text('Join Now', style: TextStyle(color: Colors.black)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInstructorCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 20.r, backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=11')),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Damar Firdauzi, S.Pi', style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w600)),
                  Text('4.9 (1.972 Reviews)', style: GoogleFonts.poppins(fontSize: 11.sp, color: Colors.black45)),
                ],
              )
            ],
          ),
          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Today • 4:00 PM', style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500)),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CoachingDetailEnrolnow())),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFDDF247), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r))),
                child: const Text('Enroll Now', style: TextStyle(color: Colors.black)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      children: [
        const Icon(Icons.circle, size: 6, color: Colors.grey),
        SizedBox(width: 8.w),
        Text(text, style: GoogleFonts.poppins(fontSize: 11.sp, color: Colors.black54)),
      ],
    );
  }
}