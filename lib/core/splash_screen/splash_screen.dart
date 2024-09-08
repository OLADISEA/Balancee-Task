import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_colors.dart';
import '../../widgets/app_text.dart';
import '../screens/rewards_summary_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RewardsSummaryPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.gradientColor1, AppColor.gradientColor2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(80 * pi / 180), // 80 degrees in radians
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 300.h,),
            Container(
              height: 200.h,
              width: 200.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: SizedBox(
                  width: 90.h,
                  child: Transform.rotate(
                    angle: -30 * pi / 180, // Rotate the text by 80 degrees
                    child: AppText(
                      textAlign: TextAlign.center,
                      text: "Balanceè App",
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 280.h,),
            AppText(text: "Rewards made easy",color: Colors.white,fontSize: 15.sp,)
          ],
        ),
      ),
    );
  }
}
