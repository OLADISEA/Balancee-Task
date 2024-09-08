import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

// Reusable card for cashback details
class CustomCard extends StatelessWidget {
  final IconData icon;
  final Color iconBackground;
  final String title;
  final double amount;
  final Color? color;

  const CustomCard({super.key,
    required this.icon,
    required this.iconBackground,
    required this.title,
    required this.amount,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 160.w,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15)
      ),

      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                  color: iconBackground,
                  shape: BoxShape.circle
              ),
              child: Icon(icon,color: Colors.white,),
            ),
            SizedBox(height: 15.h,),
            AppText(
              text: "₦${amount.toStringAsFixed(2)}", fontSize: 15.sp, fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            AppText(
              text: title,
              fontSize: 15.sp,
              color: const Color(0xff00005b),

            ),
          ],
        ),
      ),
    );
  }
}
