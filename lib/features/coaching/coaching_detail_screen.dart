import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart'; // Import iconsax untuk konsistensi
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class CoachingDetailScreen extends StatefulWidget {
  const CoachingDetailScreen({super.key});

  @override
  State<CoachingDetailScreen> createState() => _CoachingDetailScreenState();
}

class _CoachingDetailScreenState extends State<CoachingDetailScreen> {

  bool _isSaved = false;

  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'MLpWrANjFbI',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// VIDEO SECTION
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  children: [
                    /// TOP BAR
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // TOMBOL SAVE YANG INTERAKTIF
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isSaved = !_isSaved;
                            });
                          },
                          borderRadius: BorderRadius.circular(50),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 42.w,
                            height: 42.w,
                            decoration: BoxDecoration(
                              color: _isSaved ? const Color(0xFF121212) : Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _isSaved ? Iconsax.archive_15 : Iconsax.archive_add,
                              size: 20.sp,
                              color: _isSaved ? Colors.white : Colors.black,
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            /// LIVE
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 6.w,
                                    height: 6.w,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    'Live',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: 10.w),

                            /// TIME
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 14.sp,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '8:00 AM',
                                    style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
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

                    SizedBox(height: 18.h),

                    /// VIDEO
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: YoutubePlayer(
                          controller: _youtubeController,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.red,
                          progressColors: const ProgressBarColors(
                            playedColor: Colors.red,
                            handleColor: Colors.redAccent,
                          ),
                          bottomActions: [
                            const SizedBox(width: 14.0),
                            CurrentPosition(),
                            const SizedBox(width: 8.0),
                            ProgressBar(isExpanded: true),
                            RemainingDuration(),
                            const PlaybackSpeedButton(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// CONTENT
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// PROFILE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 22.r,
                              backgroundImage: const NetworkImage(
                                'https://i.pravatar.cc/150?img=11',
                              ),
                            ),

                            SizedBox(width: 10.w),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Damar Firdauzi, S.Pi',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 14.sp,
                                    ),
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

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F1F1),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.person, size: 16.sp),
                              SizedBox(width: 5.w),
                              Text(
                                '72',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 22.h),

                    /// TITLE
                    Text(
                      'Strategis to Ace the CPNS Exam',
                      style: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 14.h),

                    _buildBullet('Tips for TWK, TIU, TKP'),
                    _buildBullet('Quick solving methods'),
                    _buildBullet('Live Q&A session'),

                    SizedBox(height: 24.h),

                    /// CHAT INPUT
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50.h,
                            padding:
                                EdgeInsets.symmetric(horizontal: 18.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F4F4),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Ask your question here',
                                hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 10.w),

                        Container(
                          width: 50.w,
                          height: 50.w,
                          decoration: const BoxDecoration(
                            color: Color(0xFFDDF247),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Message Sent'),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.send,
                              size: 22.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30.h),

                    /// LEARNERS
                    Text(
                      'Learners',
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 20.h),

                    _buildLearnerItem(
                      name: 'Adinda Y.',
                      time: '4 minutes ago',
                      question:
                          'Apa saja trik untuk menghadapi soal TWK tentang Pancasila?',
                      answer:
                          'Untuk TWK tentang Pancasila, pastikan memahami nilai-nilai dasar Pancasila dan perkembangannya sejarahnya.',
                    ),

                    SizedBox(height: 20.h),

                    _buildLearnerItem(
                      name: 'Fajar',
                      time: '9 minutes ago',
                      question:
                          'Bagaimana cara meningkatkan kemampuan logika untuk soal TIU?',
                      answer:
                          'Untuk soal TIU, latihan soal logika secara teratur dan pelajari tips untuk mengenali pola soal cepat.',
                    ),

                    SizedBox(height: 20.h),

                    _buildLearnerItem(
                      name: 'Susi',
                      time: '12 minutes ago',
                      question:
                          'Pak Damar, bisa dijelaskan tentang metode cepat soal TKP?',
                      answer:
                          'Metode cepat TKP biasanya fokus pada prioritas tindakan dan sikap profesional dalam pekerjaan.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Container(
            width: 4.w,
            height: 4.w,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLearnerItem({
    required String name,
    required String time,
    required String question,
    required String answer,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 18.r,
          backgroundImage: const NetworkImage(
            'https://i.pravatar.cc/150?img=12',
          ),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    time,
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 4.h),

              Text(
                question,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Colors.black54,
                ),
              ),

              SizedBox(height: 12.h),

              Container(
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 14.r,
                      backgroundImage: const NetworkImage(
                        'https://i.pravatar.cc/150?img=11',
                      ),
                    ),

                    SizedBox(width: 10.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Damar Firdauzi, S.Pi',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                'Mentor',
                                style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 4.h),

                          Text(
                            answer,
                            style: GoogleFonts.poppins(
                              fontSize: 11.sp,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
