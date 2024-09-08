import 'package:cash_track/core/screens/promo_code_page.dart';
import 'package:cash_track/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/cashback/cashback_bloc.dart';
import '../../bloc/cashback/cashback_event.dart';
import '../../config/app_colors.dart';
import '../../data/shared_preference_helper.dart';
import '../../widgets/app_text.dart';

class CashOutPage extends StatefulWidget {

  const CashOutPage({super.key});

  @override
  _CashOutPageState createState() => _CashOutPageState();
}

class _CashOutPageState extends State<CashOutPage> with SingleTickerProviderStateMixin {
  late double availableCashback;
  String selectedCashoutMethod = "Direct Cashout";
  final TextEditingController _cashoutAmountController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  String? _errorMessage;  // To track the error message

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.init();
    availableCashback = SharedPreferencesHelper.getAvailableCashback();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _cashoutAmountController.addListener(_validateCashoutAmount);  // Validate on input change

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _cashoutAmountController.dispose();
    super.dispose();
  }

  void _validateCashoutAmount() {
    final double cashoutAmount = double.tryParse(_cashoutAmountController.text) ?? 0.0;
    setState(() {
      if (cashoutAmount > availableCashback) {
        _errorMessage = "Amount exceeds available cashback.";
      } else {
        _errorMessage = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: AppText(text: 'CashOut Options',fontSize: 20.sp, fontWeight: FontWeight.bold,),
      ),
      body: Container(
        margin: EdgeInsets.all(15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15.h),
              decoration: BoxDecoration(
                color: AppColor.kWhite,
                borderRadius: BorderRadius.circular(15.r)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "CashOut Method",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildCashoutOptions(),
                  const SizedBox(height: 20),
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: _buildCashoutAmountField(),
                  ),

                ],
              ),
            ),
            SizedBox(height: 20.h),

            AppButton(
                text: "Confirm Cashout",
                buttonColor: AppColor.buttonColor,
                fontSize: 15.sp,
                radius: 5.r,
                onTap: _errorMessage == null ? _confirmCashout : null
                 // Disable if there's an error

            )
          ],
        ),
      ),
    );
  }

  Widget _buildCashoutOptions() {
    return Column(
      children: [
        _buildCashoutOption('Direct Cashout'),
        _buildCashoutOption('Future Discount'),
        _buildCashoutOption('Promo Code'),
      ],
    );
  }

  Widget _buildCashoutOption(String title) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: ListTile(
        key: ValueKey<String>(title),
        title: Text(title),
        leading: Radio<String>(
          value: title,
          groupValue: selectedCashoutMethod,
          onChanged: (value) {
            setState(() {
              selectedCashoutMethod = value!;
            });
          },
        ),
      ),
    );
  }

  Widget _buildCashoutAmountField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: "CashOut Amount", fontSize: 18.sp, fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _cashoutAmountController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],  // Only allow numbers
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r)
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.kGrey
              )
            ),
            hintText: "Enter amount to cash out",
            errorText: _errorMessage,  // Display error message
          ),
        ),
        const SizedBox(height: 10),
        AppText(
          text: "Available Cashback: ₦${availableCashback.toStringAsFixed(2)}",
          color: AppColor.kBlack,fontSize: 14.sp,),

      ],
    );
  }


  void _confirmCashout() {
    final double cashoutAmount = double.tryParse(_cashoutAmountController.text) ?? 0.0;

    if (cashoutAmount <= 0 || cashoutAmount > availableCashback) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid cashout amount')),
      );
      return;
    }

    switch (selectedCashoutMethod) {
      case "Direct Cashout":
        _performDirectCashout(cashoutAmount);
        break;
      case "Future Discount":
        _convertToFutureDiscount(cashoutAmount);
        break;
      case "Promo Code":
        _generatePromoCode(cashoutAmount);
        break;
    }
  }

  void _performDirectCashout(double amount) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController accountController = TextEditingController();
        return AlertDialog(
          title: const Text("Account"),
          content: TextField(
            controller: accountController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              hintText: "Enter Account Number",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColor.tertiaryColor
              ),
              onPressed: () {
                Navigator.pop(context);  // Close dialog without doing anything
              },
              child: AppText(text:"Cancel",fontSize: 10.sp,color: AppColor.kBlack,),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.buttonColor
              ),
              onPressed: () {
                final String accountNumber = accountController.text.trim();

                if (accountNumber.isEmpty || accountNumber.length < 10) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a valid account number'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                } else {
                  Navigator.pop(context);  // Close the dialog
                  _completeDirectCashout(amount, accountNumber);
                }
              },
              child: AppText(text: "Confirm",fontSize: 10.sp,color: AppColor.kWhite,),
            ),
          ],
        );
      },
    );
  }

  void _completeDirectCashout(double amount, String accountNumber) async {
    setState(() {
      availableCashback -= amount;
      print("$availableCashback is the available cash left");
    });


    await SharedPreferencesHelper.setAvailableCashback(availableCashback);
    _cashoutAmountController.clear();


    // Dispatch an event to update the cashback value in the Bloc
    BlocProvider.of<CashbackBloc>(context).add(LoadAvailableCashbackEvent ());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Direct cashout of ₦${amount.toStringAsFixed(2)} to account $accountNumber completed'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _convertToFutureDiscount(double amount) async {
    setState(() {
      availableCashback -= amount;
    });

    // Save the updated cashback to shared preferences
    await SharedPreferencesHelper.setAvailableCashback(availableCashback);
    _cashoutAmountController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cashback of ₦${amount.toStringAsFixed(2)} converted to future discount')),
    );
  }

  void _generatePromoCode(double amount) async {
    setState(() {
      availableCashback -= amount;
    });

    // Save the updated cashback to shared preferences
    await SharedPreferencesHelper.setAvailableCashback(availableCashback);
    _cashoutAmountController.clear();


    String promoCode = "PROMO${DateTime.now().millisecondsSinceEpoch}";
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PromoCodeConfirmationPage(
          promoCode: promoCode,
          cashbackAmount: amount,
        ),
      ),
    );
  }

}

