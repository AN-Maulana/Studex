import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/theme/app_colors.dart';
import 'checkout_screen.dart'; // We will create this next

class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  // 'annual', '6months', 'monthly', or null
  String? selectedPlan = '6months'; // Default selected as per Figma "Pricing select"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  _buildCurrentPlan(),
                  SizedBox(height: 24.h),
                  _buildRecommendedUpdate(),
                  SizedBox(height: 24.h),
                  _buildChoosePlan(),
                ],
              ),
            ),
            _buildUpgradeButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  shape: BoxShape.circle,
                ),
                child: Icon(Iconsax.arrow_left, size: 20.sp, color: Colors.black),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Text(
          'Upgrade to Premium',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Learn more, practice more, and prepare better.',
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentPlan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current Plan',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(20.r),
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
                      Text(
                        'Free Tier',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Standard user access',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color:  const Color(0xFFF5F5F5),
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      'Active Now',
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Icon(Iconsax.clock, size: 14.sp, color: Colors.grey),
                  SizedBox(width: 4.w),
                  Text(
                    'Limited Course',
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Icon(Iconsax.clock, size: 14.sp, color: Colors.grey),
                  SizedBox(width: 4.w),
                  Text(
                    'No live coaching',
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedUpdate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended Update',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FBE7), // Light lime bg
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryLime.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  'Premium Benefits',
                  style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Get full access to all materials and\nexclusive features to boost your score.',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Standard user access',
                style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  color: Colors.grey,
                ),
              ),
              // ... di dalam _buildRecommendedUpdate ...
              SizedBox(height: 16.h),
              _buildBenefitItem('All premium courses'),
              SizedBox(height: 12.h), // Jarak antar item ditambah sedikit
              _buildBenefitItem('Unlimited exams & tryouts'),
              SizedBox(height: 12.h),
              _buildBenefitItem('Exclusive live coaching sessions'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBenefitItem(String text) {
    return Row(
      children: [
        // Lingkaran Icon
        Container(
          width: 32.w, // Ukuran lingkaran diperbesar agar proporsional
          height: 32.w,
          decoration: BoxDecoration(
            color: AppColors.primaryLime, // Warna lime solid
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Iconsax.note_21, // Menggunakan Iconsax agar konsisten dengan headermu
              size: 16.sp,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        // Label Text
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.7), // Sedikit pudar agar teks tidak terlalu dominan
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChoosePlan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose Your Premium Plan',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
           fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12.h),
        _buildPlanCard(
          id: 'annual',
          title: 'Annual',
          subtitle: 'Save 40% annually',
          price: '\$5.99',
          period: '/mo',
        ),
        SizedBox(height: 12.h),
        _buildPlanCard(
          id: '6months',
          title: '6 Months',
          subtitle: 'Save 40% annually',
          price: '\$7.99',
          period: '/mo',
        ),
        SizedBox(height: 12.h),
        _buildPlanCard(
          id: 'monthly',
          title: 'Monthly',
          subtitle: 'No Commitment',
          price: '\$12.99',
          period: '/mo',
        ),
      ],
    );
  }

  Widget _buildPlanCard({
    required String id,
    required String title,
    required String subtitle,
    required String price,
    required String period,
  }) {
    final isSelected = selectedPlan == id;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = id;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF121212) : Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: isSelected ? const Color(0xFF121212) : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Custom Radio Button
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primaryLime : Colors.grey.shade400,
                  width: isSelected ? 5.w : 1.w,
                ),
                color: isSelected ? const Color(0xFF121212) : Colors.transparent,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      color: isSelected ? Colors.grey.shade400 : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  period,
                  style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    color: isSelected ? Colors.grey.shade400 : Colors.grey,
                    height: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpgradeButton() {
    return Positioned(
      bottom: 20.h,
      left: 20.w,
      right: 20.w,
      child: InkWell(
        onTap: () {
          if (selectedPlan != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutScreen(selectedPlan: selectedPlan!)),
            );
          }
        },
        child: Container(
          height: 58.h,
          decoration: BoxDecoration(
            color: AppColors.primaryLime,
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryLime.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Upgrade Now',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
