import 'package:cash_track/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color? textColor;
  final double fontSize;
  final double? width;
  final double radius;
  final void Function()? onTap;
  const AppButton({
    super.key,
    required this.text,
    required this.buttonColor,
    this.textColor,
    required this.fontSize,
    this.width, required this.radius, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: EdgeInsets.all(10.h),
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius)
        ),
        child: Center(child: AppText(text: text,color: textColor??Colors.white,fontSize: fontSize,)),
      ),
    );
  }
}
