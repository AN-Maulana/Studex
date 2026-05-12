import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/theme/app_colors.dart';
import 'set_new_password_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _otpController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    bool isOtpComplete = _otpController.text.length == 6;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'Verify Your Email',
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                        children: const [
                          TextSpan(text: 'We\'ve sent an OTP code to your email\n'),
                          TextSpan(
                            text: 'jacksmith@gmail.com',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(text: '. Enter the code to continue.'),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),
                    _buildOtpFields(),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Resend code in ',
                          style: GoogleFonts.poppins(fontSize: 12.sp,  color: Colors.black,),
                        ),
                        Text(
                          '01:06',
                          style: GoogleFonts.poppins(fontSize: 12.sp, color: AppColors.primaryLime, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    _buildVerifyButton(context, isOtpComplete),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Text(
            'Verify OTP',
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 44.w), // To keep the title centered
        ],
      ),
    );
  }

  Widget _buildOtpFields() {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, (index) {
            bool hasValue = index < _otpController.text.length;
            String digit = hasValue ? _otpController.text[index] : '0';

            return Container(
              width: 40.w,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: hasValue ? AppColors.primaryLime : Colors.grey.shade300,
                    width: 2.w,
                  ),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Text(
                    digit,
                    style: GoogleFonts.poppins(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: hasValue ? Colors.black : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        Positioned.fill(
          child: Opacity(
            opacity: 0.0,
            child: TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              autofocus: true,
              showCursor: false,
              decoration: const InputDecoration(
                counterText: "",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerifyButton(BuildContext context, bool isActive) {
    return InkWell(
      onTap: isActive
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SetNewPasswordScreen()),
              );
            }
          : null,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryLime : const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(
          child: Text(
            'Verify',
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
