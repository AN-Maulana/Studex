import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart'; // Import iconsax

class CoachingDetailEnrolnow extends StatefulWidget {
  const CoachingDetailEnrolnow({super.key});

  @override
  State<CoachingDetailEnrolnow> createState() => _CoachingDetailEnrolnowState();
}

class _CoachingDetailEnrolnowState extends State<CoachingDetailEnrolnow> {
  // State untuk melacak apakah user sudah enroll atau belum
  bool _isEnrolled = false;

  // State untuk melacak apakah coaching ini di-save/bookmark atau tidak
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 14.h),

              /// --- CARD ATAS (INFO UTAMA) ---
              Container(
                margin: EdgeInsets.symmetric(horizontal: 14.w),
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// HEADER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // TOMBOL SAVE (LOGIKA INTERAKTIF)
                        _buildSaveButton(),
                        _buildTimeBadge('Today • 4:00 PM'),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    /// PROFIL INSTRUKTUR
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 22.r,
                              backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=11'),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Damar Firdauzi, S.Pi',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.orange, size: 12.sp),
                                    SizedBox(width: 4.w),
                                    Text(
                                      '4.9 (1.972 Reviews)',
                                      style: GoogleFonts.poppins(
                                        fontSize: 11.sp,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (_isEnrolled) _buildPersonBadge('129'),
                      ],
                    ),
                    SizedBox(height: 22.h),

                    /// JUDUL
                    Text(
                      'Strategis to Ace the CPNS Exam',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    /// POIN-POIN
                    _buildBulletItem('Tips for TWK, TIU, TKP'),
                    _buildBulletItem('Quick solving methods'),
                    _buildBulletItem('Live Q&A session'),
                    SizedBox(height: 24.h),

                    /// DINAMIS: TOMBOL vs CHAT INPUT
                    _isEnrolled ? _buildChatInput() : _buildEnrollButton(),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              /// --- CARD BAWAH (DESKRIPSI / LEARNERS) ---
              Container(
                margin: EdgeInsets.symmetric(horizontal: 14.w),
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28.r),
                ),
                child: _isEnrolled ? _buildLearnersList() : _buildAboutSection(),
              ),
              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Tombol Save
  Widget _buildSaveButton() {
    return InkWell(
      onTap: () {
        setState(() {
          _isSaved = !_isSaved; 
        });
      },
      borderRadius: BorderRadius.circular(50),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: _isSaved ? const Color(0xFF121212) : const Color(0xFFF4F4F4),
          shape: BoxShape.circle,
        ),
        child: Icon(
          _isSaved ? Iconsax.archive_15 : Iconsax.archive_add,
          size: 18.sp,
          color: _isSaved ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  // Widget Tombol Enroll
  Widget _buildEnrollButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: _onEnrollPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFDDF247),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
        ),
        child: Text(
          'Enroll Now',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Widget Chat Input
  Widget _buildChatInput() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: TextField(
              style: GoogleFonts.poppins(fontSize: 13.sp),
              decoration: InputDecoration(
                hintText: 'Ask your question here',
                hintStyle: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          width: 50.h,
          height: 50.h,
          decoration: const BoxDecoration(color: Color(0xFFDDF247), shape: BoxShape.circle),
          child: Icon(Icons.send_rounded, color: Colors.black, size: 20.sp),
        ),
      ],
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Enrolled Learners'),
            Text(
              '129 Enrolled',
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                color: const Color(0xFFB2C92E),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 14.h),
        _buildAvatarStack(),
        SizedBox(height: 25.h),
        _buildSectionTitle('About this Coaching'),
        SizedBox(height: 10.h),
        Text(
          'Join our exclusive coaching session designed for serious CPNS aspirants. Damar Firdauzi will share his proven roadmap that helped over 1,000 students secure their government positions.',
          style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.black54, height: 1.6),
        ),
      ],
    );
  }

  Widget _buildLearnersList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Learners'),
        SizedBox(height: 18.h),
        _buildComment('Adinda Y.', '4m ago', 'Apa kiat menghadapi soal TWK Pancasila?'),
        _buildComment('Fajar', '9m ago', 'Cara tingkatkan logika untuk soal TIU?'),
        _buildComment('Susi', '12m ago', 'Pak Damar, metode cepat untuk TKP bagaimana?'),
      ],
    );
  }

  void _onEnrollPressed() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFDDF247),
                child: Icon(Icons.check, color: Colors.black),
              ),
              SizedBox(height: 15.h),
              Text(
                'Enroll successfully!',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 15.sp),
              ),
            ],
          ),
        ),
      ),
    );

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Navigator.pop(context);
      setState(() {
        _isEnrolled = true;
      });
    }
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w600)),
        Container(width: 35.w, height: 3.h, color: const Color(0xFFDDF247)),
      ],
    );
  }

  Widget _buildComment(String name, String time, String msg) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 16.r, backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=12')),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name, style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w600)),
                    SizedBox(width: 6.w),
                    Text(time, style: GoogleFonts.poppins(fontSize: 10.sp, color: Colors.black38)),
                  ],
                ),
                Text(msg, style: GoogleFonts.poppins(fontSize: 11.sp, color: Colors.black54, height: 1.4)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBulletItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        children: [
          Container(width: 4.w, height: 4.w, decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle)),
          SizedBox(width: 8.w),
          Text(text, style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.black45)),
        ],
      ),
    );
  }

  Widget _buildTimeBadge(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(color: const Color(0xFFF4F4F4), borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        children: [
          Icon(Icons.access_time, size: 12.sp, color: Colors.black54),
          SizedBox(width: 5.w),
          Text(text, style: GoogleFonts.poppins(fontSize: 11.sp, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildPersonBadge(String count) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(color: const Color(0xFFF4F4F4), borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        children: [
          Icon(Icons.person_outline, size: 14.sp, color: Colors.black),
          SizedBox(width: 4.w),
          Text(count, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildAvatarStack() {
    return Row(
      children: [
        ...List.generate(
          3,
          (i) => Transform.translate(
            offset: Offset(-8.w * i, 0),
            child: CircleAvatar(
              radius: 18.r,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                  radius: 16.r,
                  backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=5')),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(-24.w, 0),
          child: CircleAvatar(
            radius: 18.r,
            backgroundColor: const Color(0xFFEEEEEE),
            child: Text(
              '120+',
              style: GoogleFonts.poppins(
                  fontSize: 9.sp, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}