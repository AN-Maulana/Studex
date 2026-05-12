import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/theme/app_colors.dart';
import 'payment_success_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final String selectedPlan;

  const CheckoutScreen({super.key, required this.selectedPlan});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedPaymentMethod = 'credit_card';
  bool termAccepted = true;
  bool corporateInvoice = false;

  @override
  Widget build(BuildContext context) {
    // Determine plan details based on selectedPlan
    String planTitle = '6 Months Premium';
    String planPrice = '\$47.94'; // $7.99 * 6
    if (widget.selectedPlan == 'annual') {
      planTitle = 'Annual Premium';
      planPrice = '\$71.88'; // $5.99 * 12
    } else if (widget.selectedPlan == 'monthly') {
      planTitle = 'Monthly Premium';
      planPrice = '\$12.99';
    }

    // Following Figma price exactly for visual consistency
    String totalPrice = '\$125'; 

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light gray background behind cards
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPlanSummaryCard(planTitle),
                    SizedBox(height: 24.h),
                    _buildPromoCode(),
                    SizedBox(height: 24.h),
                    _buildPaymentMethodSection(),
                    SizedBox(height: 100.h), // Padding for bottom bar
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _buildBottomBar(totalPrice),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
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
            'Checkout',
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 44.w), // Balance for centering title
        ],
      ),
    );
  }

  Widget _buildPlanSummaryCard(String planTitle) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                planTitle,
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryLime,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  'Best Value',
                  style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            'Popular Choose',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey.shade400,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$7.99',
                style: GoogleFonts.poppins(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 4.h, left: 4.w),
                child: Text(
                  '/total',
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(color: Colors.grey.shade800),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Iconsax.clock, size: 14.sp, color: Colors.grey.shade400),
              SizedBox(width: 8.w),
              Text(
                'Limited Course',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Promo Code',
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Promo Code',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    color: Colors.grey,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 12.w),
                    child: Icon(Iconsax.ticket, size: 20.sp, color: Colors.grey),
                  ),
                  prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.primaryLime,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'Apply',
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentMethodSection() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),
          _buildRadioOption('credit_card', 'Credit Card', isSelected: selectedPaymentMethod == 'credit_card'),
          SizedBox(height: 12.h),
          _buildRadioOption('paypal', 'Paypal', isSelected: selectedPaymentMethod == 'paypal', iconUrl: 'paypal'),
          SizedBox(height: 12.h),
          _buildRadioOption('gpay', 'Google Pay', isSelected: selectedPaymentMethod == 'gpay', iconUrl: 'gpay'),
          
          if (selectedPaymentMethod == 'credit_card') ...[
            SizedBox(height: 24.h),
            _buildInputField('Card Holder Name', 'Enter name on card'),
            SizedBox(height: 16.h),
            _buildInputField('Card Number', '**** **** **** ****'),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(child: _buildInputField('Expiry Date', 'MM/YY')),
                SizedBox(width: 16.w),
                Expanded(child: _buildInputField('CVV', 'MM/YY')), // Wait, CVV is MM/YY in Figma? Let's just use MM/YY or 123
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(child: _buildInputField('Expiry Date', 'MM/YY')),
                SizedBox(width: 16.w),
                Expanded(child: _buildInputField('CVV', 'MM/YY')),
              ],
            ),
            SizedBox(height: 24.h),
            _buildCheckbox('I have read the preliminary information conditions and the distance sales agreement', termAccepted, (val) {
              setState(() => termAccepted = val ?? false);
            }),
            SizedBox(height: 12.h),
            _buildCheckbox('I require a corporate invoice', corporateInvoice, (val) {
              setState(() => corporateInvoice = val ?? false);
            }),
          ]
        ],
      ),
    );
  }

  Widget _buildRadioOption(String value, String title, {required bool isSelected, String? iconUrl}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = value;
        });
      },
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey.shade400,
                width: isSelected ? 5.w : 1.w,
              ),
              color: isSelected ? Colors.white : Colors.transparent,
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          Spacer(),
          if (iconUrl == 'paypal')
            Text('PayPal', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic)),
          if (iconUrl == 'gpay')
            Row(
              children: [
                Text('G', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 16.sp)),
                Text('Pay', style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600, fontSize: 16.sp)),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: Colors.grey.shade400,
            ),
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide.none,
            ),
          ),
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckbox(String text, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => onChanged(!value),
          child: Container(
            width: 18.w,
            height: 18.w,
            margin: EdgeInsets.only(top: 2.h),
            decoration: BoxDecoration(
              border: Border.all(color: value ? Colors.black : Colors.grey.shade400),
              borderRadius: BorderRadius.circular(4.r),
              color: value ? Colors.black : Colors.transparent,
            ),
            child: value ? Icon(Icons.check, size: 14.sp, color: Colors.white) : null,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 10.sp,
              color: Colors.grey.shade500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(String price) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
              Text(
                price,
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentSuccessScreen()),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: const Color(0xFF121212),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text(
                'Pay',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
