import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExamExplanations extends StatefulWidget {
  const ExamExplanations({super.key});

  @override
  State<ExamExplanations> createState() => _ExamExplanationsState();
}

class _ExamExplanationsState extends State<ExamExplanations> {
  int currentQuestionIndex = 0;
  final int totalQuestions = 7;

  // Data simulasi: status jawaban user (true = benar, false = salah)
  // Nomor 1 (index 0) salah, sisanya benar.
  final List<bool> answerStatus = [false, true, true, true, true, true, true];

  void _nextQuestion() {
    if (currentQuestionIndex < totalQuestions - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  void _prevQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // --- HEADER & INDICATOR SECTION ---
            Container(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 25.h),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIconButton(Icons.bookmark_border_rounded),
                      Text(
                        'Exam',
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    'Final Exam - Marine Section',
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Indikator Angka (Nomor 1 Merah, lainnya Hijau)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(totalQuestions, (index) {
                        bool userIsCorrect = answerStatus[index];
                        bool isCurrent = index == currentQuestionIndex;

                        return GestureDetector(
                          onTap: () => setState(() => currentQuestionIndex = index),
                          child: Container(
                            margin: EdgeInsets.only(right: 12.w),
                            width: 50.w,
                            height: 50.w,
                            decoration: BoxDecoration(
                              color: isCurrent 
                                  ? Colors.white 
                                  : (userIsCorrect ? const Color(0xFFD4F05B) : const Color(0xFFD32F2F)), 
                              shape: BoxShape.circle,
                              border: isCurrent 
                                  ? Border.all(color: const Color(0xFFD4F05B), width: 1.5)
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: GoogleFonts.poppins(
                                  color: isCurrent 
                                      ? Colors.black 
                                      : (userIsCorrect ? Colors.black : Colors.white),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 15.h),

            // --- CONTENT SECTION ---
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Card Pertanyaan
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      padding: EdgeInsets.all(25.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildQuestionHeader(),
                          SizedBox(height: 24.h),
                          Text(
                            'Marine capture fisheries governance in Indonesia is primarily based on the following principles, except',
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          
                          // Logika Opsi
                          _buildResultOption(
                            "Sustainability of resources", 
                            isCorrect: false, 
                            isUserChoice: !answerStatus[currentQuestionIndex] && currentQuestionIndex == 0,
                          ),
                          _buildResultOption(
                            "Protection of marine living resources", 
                            isCorrect: true, 
                            isUserChoice: answerStatus[currentQuestionIndex] && currentQuestionIndex != 0,
                          ),
                          _buildResultOption("Short-term exploitation optimization", isNeutral: true),
                          _buildResultOption("Regulation-based management", isNeutral: true),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 15.h),

                    // Card Pembahasan
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                      padding: EdgeInsets.all(25.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Discussion & Explanation',
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            "Indonesia's fisheries governance is strictly regulated under Law No. 31/2004 (amended by Law No. 45/2009). The primary focus is on Sustainable Management.\n\nThe term \"short-term exploitation optimization\" is contrary to the core principle of sustainability, which seeks to preserve resources for future generations.",
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              color: Colors.black54,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),

            // --- BOTTOM NAVIGATION ---
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: currentQuestionIndex > 0 ? _prevQuestion : null,
                    child: _buildNavButton(
                      Icons.chevron_left, 
                      "Prev", 
                      const Color(0xFFF2F2F2), 
                      Colors.black45, 
                      isLeading: true
                    ),
                  ),
                  GestureDetector(
                    onTap: _nextQuestion,
                    child: _buildNavButton(
                      null, 
                      "Submit", 
                      const Color(0xFFD4F05B), 
                      Colors.black, 
                      isLeading: false
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

  Widget _buildQuestionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Question ${currentQuestionIndex + 1} of 50',
            style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black54),
          ),
        ),
        Row(
          children: [
            const Icon(Icons.access_time, color: Color(0xFFD32F2F), size: 20),
            SizedBox(width: 5.w),
            Text('59:45', style: GoogleFonts.poppins(color: const Color(0xFFD32F2F), fontWeight: FontWeight.w600, fontSize: 14.sp)),
          ],
        )
      ],
    );
  }

  Widget _buildResultOption(String text, {bool isCorrect = false, bool isUserChoice = false, bool isNeutral = false}) {
    Color circleColor = Colors.transparent;
    Border? border;
    Widget? icon;

    if (isCorrect) {
      circleColor = const Color(0xFFD4F05B);
      border = null;
      icon = const Icon(Icons.check, size: 14, color: Colors.black);
    } else if (isUserChoice) {
      circleColor = Colors.white;
      border = Border.all(color: const Color(0xFFD32F2F), width: 1.5);
      icon = Center(
        child: Container(
          width: 10.w,
          height: 10.w,
          decoration: const BoxDecoration(
            color: Color(0xFFD32F2F),
            shape: BoxShape.circle,
          ),
        ),
      );
    } else {
      circleColor = Colors.white;
      border = Border.all(color: Colors.black26, width: 1.5);
      icon = null;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Container(
            width: 22.w,
            height: 22.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: circleColor,
              border: border,
            ),
            child: icon,
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Text(text, style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black87)),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(IconData? icon, String label, Color color, Color textColor, {bool isLeading = true}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null && isLeading) Icon(icon, size: 20, color: textColor),
          if (icon != null && isLeading) SizedBox(width: 4.w),
          Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14.sp, color: textColor)),
          if (icon != null && !isLeading) SizedBox(width: 4.w),
          if (icon != null && !isLeading) Icon(icon, size: 20, color: textColor),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      width: 48.w,
      height: 48.w,
      decoration: const BoxDecoration(color: Color(0xFFF2F2F2), shape: BoxShape.circle),
      child: IconButton(icon: Icon(icon, size: 24, color: Colors.black), onPressed: () {}),
    );
  }
}