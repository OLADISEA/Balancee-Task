import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_colors.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';

class PromoCodeConfirmationPage extends StatelessWidget {
  final String promoCode;
  final double cashbackAmount;

  const PromoCodeConfirmationPage({
    super.key,
    required this.promoCode,
    required this.cashbackAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Container(
          margin: EdgeInsets.only(left:16.h,right: 16.h,top: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back,size: 30.sp)),
                  SizedBox(width: 30.w,),
                  AppText(text: 'Promo Code',fontSize: 22.sp,fontWeight: FontWeight.bold,),
                ],
              ),
              SizedBox(height: 20.h,),
              _buildPromoCodeContainer(context)
            ],

          ),

        ) );
  }

  Widget _buildPromoCodeContainer(BuildContext context){
    return Container(
      padding: EdgeInsets.all(30.h),
      decoration: BoxDecoration(
          color: AppColor.kWhite,
          borderRadius: BorderRadius.circular(15.r)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: AppText(
                text:"Promo Code Generated",
                fontSize: 18.sp,
                fontWeight: FontWeight.bold
            ),
          ),

          SizedBox(height: 8.h),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
              decoration: BoxDecoration(
                color: const Color(0XFFF0F0F0),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: AppText(
                text: promoCode,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryTextColor,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          AppText(
              text:"Cashback Amount Converted: \$${cashbackAmount.toStringAsFixed(2)}",
              fontSize: 16.sp
          ),
          SizedBox(height: 10.h),
          AppButton(
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst); // Back to Rewards Summary
            },
            text: 'Back to Rewards Summary',
            buttonColor: AppColor.buttonColor,
            fontSize: 15.sp,
            radius: 5.r,
            width: 250.w,

          ),
        ],
      ),
    );
  }
}
