import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// --- TAMBAHKAN IMPORT INI ---
import 'exam_result_screen.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  int currentQuestionIndex = 0;
  final int totalQuestions = 7;
  int? selectedAnswer;

  void nextQuestion() {
    if (currentQuestionIndex < totalQuestions - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
      });
    } else {
      // --- LOGIKA DIUBAH UNTUK NAVIGASI ---
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ExamResultScreen(),
        ),
      );
    }
  }

  void prevQuestion() {
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
                  // App Bar Row
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
                      const SizedBox(width: 48), // Balancer for leading icon
                    ],
                  ),
                  SizedBox(height: 25.h),
                  // Title
                  Text(
                    'Final Exam - Marine Section',
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Progress Indicators
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(totalQuestions, (index) {
                        bool isCompleted = index <= currentQuestionIndex;
                        return Container(
                          margin: EdgeInsets.only(right: 12.w),
                          width: 50.w,
                          height: 50.w,
                          decoration: BoxDecoration(
                            color: isCompleted 
                                ? const Color(0xFFD4F05B) 
                                : const Color(0xFFF2F2F2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: GoogleFonts.poppins(
                                color: isCompleted ? Colors.black : Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
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

            // --- QUESTION CARD SECTION ---
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                padding: EdgeInsets.all(25.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question Count & Timer
                    Row(
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
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time, color: Color(0xFFD32F2F), size: 20),
                            SizedBox(width: 5.w),
                            Text(
                              '59:45',
                              style: GoogleFonts.poppins(
                                color: const Color(0xFFD32F2F),
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 24.h),
                    // Question Text
                    Text(
                      'Marine capture fisheries governance in Indonesia is primarily based on the following principles, except',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    // Options List
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildOption(0, "Sustainability of resources"),
                          _buildOption(1, "Protection of marine living resources"),
                          _buildOption(2, "Short-term exploitation optimization"),
                          _buildOption(3, "Regulation-based management"),
                        ],
                      ),
                    ),
                    // Navigation Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Prev Button
                        _buildNavButton(
                          onPressed: currentQuestionIndex > 0 ? prevQuestion : null,
                          label: 'Prev',
                          icon: Icons.chevron_left,
                          isLeading: true,
                          color: const Color(0xFFF2F2F2),
                          textColor: Colors.black45,
                        ),
                        // Next/Submit Button
                        _buildNavButton(
                          onPressed: nextQuestion,
                          label: currentQuestionIndex == totalQuestions - 1 ? 'Submit' : 'Next',
                          icon: Icons.chevron_right,
                          isLeading: false,
                          color: const Color(0xFFD4F05B),
                          textColor: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      width: 48.w,
      height: 48.w,
      decoration: const BoxDecoration(
        color: Color(0xFFF2F2F2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: 24),
        onPressed: () {},
      ),
    );
  }

  Widget _buildOption(int index, String text) {
    bool isSelected = selectedAnswer == index;
    return GestureDetector(
      onTap: () => setState(() => selectedAnswer = index),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            Container(
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.transparent : Colors.black26, 
                  width: 1.5,
                ),
                color: isSelected ? const Color(0xFFD4F05B) : Colors.transparent,
              ),
              child: isSelected 
                  ? const Icon(Icons.check, size: 14, color: Colors.black) 
                  : null,
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton({
    required VoidCallback? onPressed,
    required String label,
    required IconData icon,
    required bool isLeading,
    required Color color,
    required Color textColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        disabledBackgroundColor: color,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLeading) Icon(icon, color: textColor, size: 20),
          if (isLeading) SizedBox(width: 4.w),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
          if (!isLeading && label != 'Submit') SizedBox(width: 4.w),
          if (!isLeading && label != 'Submit') Icon(icon, color: textColor, size: 20),
        ],
      ),
    );
  }
}