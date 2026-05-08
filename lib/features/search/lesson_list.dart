import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// Import file exam screen Anda di sini
import 'exam_screen.dart'; 

class LessonListScreen extends StatefulWidget {
  const LessonListScreen({super.key});

  @override
  State<LessonListScreen> createState() => _LessonListScreenState();
}

class _LessonListScreenState extends State<LessonListScreen> {
  // Variabel untuk melacak tab mana yang aktif
  String activeTab = "Lessons";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // --- Header & Video Player Section ---
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildHeaderIcon(Icons.bookmark_border),
                      Text(
                        'Marine & Fisheries',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      _buildHeaderIcon(Icons.bookmark_border),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  _buildVideoPlaceholder(),
                  SizedBox(height: 20.h),
                  Text(
                    'Module 1: Fishery Capture\nProduction Supervisor',
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _buildInstructorSection(),
                  SizedBox(height: 16.h),
                  _buildMainProgress(),
                ],
              ),
            ),

            // --- Scrollable Content ---
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Bagian Description ---
                      Text(
                        'Description',
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                        child: Divider(color: Color(0xFFD4E157), thickness: 2),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'This learning path helps you prepare for CPNS roles in the marine and fisheries sector, especially in capture fisheries supervision...',
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: Colors.grey,
                            height: 1.5),
                      ),
                      SizedBox(height: 8.h),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('View All',
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    color: const Color(0xFFD4E157),
                                    fontWeight: FontWeight.w600)),
                            const Icon(Icons.keyboard_arrow_down,
                                color: Color(0xFFD4E157), size: 18),
                          ],
                        ),
                      ),

                      SizedBox(height: 20.h),
                      _buildTabs(),
                      SizedBox(height: 25.h),

                      // KONTEN DINAMIS BERDASARKAN TAB
                      if (activeTab == "Lessons") ...[
                        _buildLessonItem("Module 1: Fishery Capture Production S...", 1.0, isVideo: true),
                        _buildLessonItem("Module 2: Fishery Capture Production...", 1.0, isVideo: true),
                        _buildLessonItem("Module 3: Fishery Capture Productio...", 0.64, isVideo: false),
                        _buildLessonItem("Module 3: Fishery Capture Productio...", 0.0, isVideo: false, subtitle: "Estimation 12 mins"),
                        _buildLessonItem("Module 4: Fishery Capture Productio...", 0.0, isVideo: false, subtitle: "Estimation 12 mins"),
                        _buildLessonItem("Module 5: Fishery Capture Production...", 0.0, isVideo: true, subtitle: "9:43 mins"),
                      ] else if (activeTab == "Exam") ...[
                        _buildExamCard(context, "Preliminary Assessment", "Foundational knowledge check", "25 Questions", "30 mins", "Retake Exam", score: "92"),
                        SizedBox(height: 15.h),
                        _buildExamCard(context, "Final Exam - Marine Section", "Comprehensive curriculum review", "50 Questions", "60 mins", "Start Exam", isPrimary: true),
                      ] else if (activeTab == "Questions") ...[
                        _buildQuestionInput(),
                        SizedBox(height: 25.h),
                        _buildChatBubble("Adinda Y.", "4 minutes ago", "Apa saja kiat untuk menghadapi soal TWK tentang Pancasila?", "Untuk TWK tentang Pancasila, pastikan memahami nilai-nilai dasar Pancasila dan perkembangan sejarahnya."),
                        _buildChatBubble("Fajar", "9 minutes ago", "Bagaimana cara meningkatkan kemampuan logika untuk soal TIU?", "Untuk soal TIU, latihan soal logika secara teratur dan pelajari tips untuk mengenali pola soal cepat."),
                        _buildChatBubble("Susi", "12 minutes ago", "Pak Damar, bisa dijelaskan tentang metode cepat untuk soal TKP?", "Metode terbaik untuk TKP adalah dengan memposisikan diri sebagai ASN yang profesional dan berintegritas."),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 1. LESSONS ITEM ---
  Widget _buildLessonItem(String title, double progress, {required bool isVideo, String? subtitle}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            child: Icon(isVideo ? Icons.play_arrow : Icons.notes,
                color: Colors.white, size: 20.sp),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 13.sp, fontWeight: FontWeight.w500)),
                if (progress > 0) ...[
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: progress,
                            minHeight: 4.h,
                            backgroundColor: Colors.grey.shade100,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFFD4E157)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text("${(progress * 100).toInt()}%",
                          style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
                    ],
                  ),
                ] else if (subtitle != null) ...[
                  Text(subtitle,
                      style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
                ],
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Icon(Icons.arrow_forward_ios,
              size: 14.sp, color: Colors.grey.shade400),
        ],
      ),
    );
  }

  // --- 2. EXAM CARD (LOGIKA NAVIGASI DITAMBAHKAN) ---
  Widget _buildExamCard(BuildContext context, String title, String sub, String q,
      String d, String btn,
      {String? score, bool isPrimary = false}) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.grey.shade100)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: const Icon(Icons.assignment,
                      color: Colors.white, size: 18)),
              SizedBox(width: 12.w),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(title,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 14.sp)),
                    Text(sub,
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: 11.sp))
                  ])),
            ],
          ),
          SizedBox(height: 12.h),
          Row(children: [
            const Icon(Icons.access_time, size: 14, color: Colors.grey),
            Text(" $q  •  $d",
                style: TextStyle(color: Colors.grey, fontSize: 11.sp))
          ]),
          SizedBox(height: 15.h),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Navigasi ke ExamScreen jika tombol "Start Exam"
                    if (btn == "Start Exam") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExamScreen()),
                      );
                    }
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                          color: isPrimary
                              ? const Color(0xFFE6FF00)
                              : const Color(0xFFF4FF81).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(25.r)),
                      child: Center(
                          child: Text(btn,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp)))),
                ),
              ),
              if (score != null) ...[
                SizedBox(width: 10.w),
                Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: const BoxDecoration(
                        color: Color(0xFFE6FF00), shape: BoxShape.circle),
                    child: Text(score,
                        style: const TextStyle(fontWeight: FontWeight.bold)))
              ]
            ],
          )
        ],
      ),
    );
  }

  // --- 3. QUESTIONS UI ---
  Widget _buildQuestionInput() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(30.r)),
            child: Text("Ask your question here",
                style: GoogleFonts.poppins(color: Colors.grey, fontSize: 13.sp)),
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: const BoxDecoration(
              color: Color(0xFFE6FF00), shape: BoxShape.circle),
          child: const Icon(Icons.send, size: 20),
        )
      ],
    );
  }

  Widget _buildChatBubble(String name, String time, String q, String reply) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 18.r,
                  backgroundImage:
                      const NetworkImage('https://i.pravatar.cc/150?u=1')),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 8.w),
                        Text(time,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 10)),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(q,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey.shade700,
                            height: 1.4)),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 45.w),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: 14.r,
                      backgroundImage:
                          const NetworkImage('https://i.pravatar.cc/150?img=11')),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Damar Firdauzi, S.Pi",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp)),
                            SizedBox(width: 5.w),
                            Text("Mentor",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 9.sp)),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(reply,
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors.grey.shade600,
                                height: 1.4)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // --- GENERAL HELPERS ---
  Widget _buildTabs() {
    return Row(
        children: ["Lessons", "Exam", "Questions"]
            .map((t) => _tabItem(t))
            .toList());
  }

  Widget _tabItem(String title) {
    bool isActive = activeTab == title;
    return GestureDetector(
      onTap: () => setState(() => activeTab = title),
      child: Container(
        margin: EdgeInsets.only(right: 20.w),
        child: Column(
          children: [
            Text(title,
                style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                    color: isActive ? Colors.black : Colors.grey)),
            if (isActive)
              Container(
                  margin: EdgeInsets.only(top: 4.h),
                  height: 2.h,
                  width: 30.w,
                  color: const Color(0xFFD4E157))
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlaceholder() {
    return Container(
        height: 180.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            image: const DecorationImage(
                image: NetworkImage('https://picsum.photos/seed/fish/600/400'),
                fit: BoxFit.cover)),
        child: const Center(
            child: Icon(Icons.play_circle_fill, color: Colors.white, size: 50)));
  }

  Widget _buildInstructorSection() {
    return Row(children: [
      CircleAvatar(
          radius: 18.r,
          backgroundImage:
              const NetworkImage('https://i.pravatar.cc/150?img=11')),
      SizedBox(width: 10.w),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Damar Firdauzi, S.Pi',
            style:
                GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.bold)),
        Text('4.9 (1.972 Reviews)',
            style: TextStyle(fontSize: 10.sp, color: Colors.grey))
      ])
    ]);
  }

  Widget _buildMainProgress() {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Progress',
            style:
                GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.bold)),
        Text('64%', style: TextStyle(color: Colors.grey, fontSize: 12.sp))
      ]),
      SizedBox(height: 8.h),
      LinearProgressIndicator(
          value: 0.64,
          backgroundColor: Colors.grey.shade100,
          color: const Color(0xFFD4E157))
    ]);
  }

  Widget _buildHeaderIcon(IconData icon) => Container(
      padding: const EdgeInsets.all(8),
      decoration:
          const BoxDecoration(color: Color(0xFFF5F5F5), shape: BoxShape.circle),
      child: Icon(icon, size: 20));
}