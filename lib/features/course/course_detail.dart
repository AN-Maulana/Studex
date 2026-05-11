import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lesson_list.dart'; // Import halaman tujuan

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // --- Bagian Atas: Header & Progress ---
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIconButton(Icons.arrow_back, () => Navigator.pop(context)),
                      Text(
                        'Marine & Fisheries',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      _buildIconButton(Icons.bookmark_border_outlined, () {}),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Module 3: Fishery Capture\nProduction Supervisor',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Improve your national insight and exam accuracy',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 14, color: Colors.grey),
                      Text(' 12 min Read', style: _infoStyle()),
                      SizedBox(width: 15.w),
                      const Icon(Icons.remove_red_eye_outlined, size: 14, color: Colors.grey),
                      Text(' 1.2k views', style: _infoStyle()),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  _buildProgressBar(),
                ],
              ),
            ),

            // --- Bagian Tengah: Konten Bacaan ---
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.w),
                child: Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Introduction to Marine Governance',
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Capture fisheries governance in Indonesia is based on the principles of sustainability and ecosystem protection. For a Fishery Supervisor, a deep understanding of fishing zones and fishing gear regulations is essential.',
                        style: _bodyStyle(),
                      ),
                      SizedBox(height: 20.h),
                      
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.network(
                          'https://picsum.photos/seed/fishing_vessel/600/350',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Diagram 1.1: Production Cycle & Surveillance Flow',
                        style: _infoStyle().copyWith(fontSize: 10.sp),
                      ),
                      
                      SizedBox(height: 20.h),
                      Text(
                        'Marine surveillance is carried out to ensure that every vessel operates with valid permits and complies with regulations set by WPPNRI (Indonesian Fisheries Management Areas).',
                        style: _bodyStyle(),
                      ),
                      SizedBox(height: 15.h),
                      Text('Key areas of supervision include:', style: _bodyStyle(isBold: true)),
                      _buildBulletPoint('Document verification: Checking SIUP, SIPI, and SIKPI before departure'),
                      _buildBulletPoint('Fishing gear inspection: Ensuring mesh size standards meet international regulations'),
                      _buildBulletPoint('Catch logbook monitoring: Tracking catch data in real time through e-logbooks'),
                      
                      SizedBox(height: 25.h),
                      Text(
                        '"The balance between production and conservation is the key to the sustainability of Indonesia\'s marine resources."',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Every supervisor is required to report field findings objectively through an integrated monitoring system to prevent illegal, unreported, and unregulated (IUU) fishing that harms marine ecosystems.',
                        style: _bodyStyle(),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // --- Bagian Bawah: Bottom Navigation ---
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios, size: 14, color: Colors.orange),
                    label: Text('Prev', style: _navStyle()),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LessonListScreen()),
                      );
                    },
                    child: Row(
                      children: [
                        Text('Next', style: _navStyle()),
                        const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.orange),
                      ],
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

  // --- Helper Widgets ---

  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color(0xFFF5F5F5),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Progress', style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w600)),
            Text('64%', style: _infoStyle()),
          ],
        ),
        SizedBox(height: 8.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: 0.64,
            minHeight: 8.h,
            backgroundColor: Colors.grey.shade200,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFD4E157)),
          ),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(text, style: _bodyStyle())),
        ],
      ),
    );
  }

  TextStyle _bodyStyle({bool isBold = false}) {
    return GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
      color: Colors.black87,
      height: 1.6,
    );
  }

  TextStyle _infoStyle() {
    return GoogleFonts.poppins(fontSize: 11.sp, color: Colors.grey);
  }

  TextStyle _navStyle() {
    return GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: Colors.orange,
    );
  }
}