import 'package:cash_track/config/app_colors.dart';
import 'package:cash_track/widgets/app_button.dart';
import 'package:cash_track/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../bloc/cashback/cashback_bloc.dart';
import '../../bloc/cashback/cashback_state.dart';
import '../../data/shared_preference_helper.dart';
import '../../widgets/app_text.dart';
import 'cashback_history_page.dart';
import 'cashout_page.dart';

class RewardsSummaryPage extends StatelessWidget {
  const RewardsSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h,),
          Container(
            height: 65.h,
            decoration: BoxDecoration(
              color: AppColor.kWhite,
              boxShadow: [
                  BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 6,   // Blur radius
              offset: const Offset(0, 3), // Shadow position (x: horizontal, y: vertical)
            ),
              ]
            ),
            child: Center(child: AppText(text:"Balanceè", fontSize: 24.sp,fontWeight: FontWeight.bold,)),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w,right: 20.w),
              color: AppColor.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h,),
                  AppText(text: 'Hi, User', fontSize: 20.sp,color: AppColor.primaryTextColor,fontWeight: FontWeight.bold,),
                  SizedBox(height: 10.h,),
                  AppText(text: "Reward Summary", fontSize: 22.sp,fontWeight: FontWeight.bold,),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildTotalCashback(context),
                      SizedBox(width: 25.w,),
                      BlocBuilder<CashbackBloc, CashbackState>(
                        builder: (context, state) {
                          if (state is CashbackUpdated) {
                            double availableCashback = state.newCashbackAmount;
                            return _buildAvailableCashback(context, availableCashback);
                          } else if (state is CashbackLoaded) {
                            return const Text("YES");
                          } else if (state is CashbackError) {
                            return const Text('Error');
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  AppButton(
                    text: "Cash Out",
                    buttonColor: AppColor.buttonColor,
                    fontSize: 15.sp,
                    textColor: AppColor.kWhite,
                    radius: 50.r,
                    width: 100.w,
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CashOutPage()));
                    },
                  ),
                  //_buildCashoutButton(context, 100.0),
                  SizedBox(height: 25.h),
                  AppText(
                    text: "Cashback History",
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kBlack,
                    ),
                  //const SizedBox(height: 10),
                  Expanded(child: _buildCashbackHistory(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }




  // Total Cashback Earned Section
  Widget _buildTotalCashback(BuildContext context) {
    return FutureBuilder<void>(
      future: SharedPreferencesHelper.init(), // Ensure preferences are loaded
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          double totalCashback = SharedPreferencesHelper.getTotalCashback();
          return CustomCard(
            icon: Icons.account_balance_wallet_outlined,
            iconBackground: AppColor.iconColor1,
            title: "Total Cashback",
            amount: totalCashback,
            color: AppColor.kWhite,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  // Available Cashback Section
  Widget _buildAvailableCashback(BuildContext context, double availableCashback) {
    return CustomCard(
      icon: Icons.attach_money_outlined,
      iconBackground: AppColor.iconColor2,
      title: "Available Cashback",
      amount: availableCashback,
      color: AppColor.kWhite,
    );
  }

  // Styled Cashback History Section
  Widget _buildCashbackHistory(BuildContext context) {
    return BlocBuilder<CashbackBloc, CashbackState>(
      builder: (context, state) {
        if (state is CashbackLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CashbackUpdated) {
          final transactions = state.transactions;
          if (transactions.isEmpty) {
            return const Center(
              child: Text(
                "No cashback history",
                style: TextStyle(fontSize: 16, color: AppColor.kGrey),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return Card(
                  color: AppColor.kWhite,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    title: Text(
                      transaction.bookingDetails,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      DateFormat('yMMMd').format(transaction.date),
                      style: const TextStyle(color: AppColor.kBlack),
                    ),
                    trailing: Text(
                      "₦${transaction.amount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CashbackHistoryDetailsPage(
                            transaction: transaction,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        } else if (state is CashbackError) {
          return Center(
            child: Text("Error: ${state.message}"),
          );
        }
        return const Center(child: Text("No cashback history"));
      },
    );
  }




}
