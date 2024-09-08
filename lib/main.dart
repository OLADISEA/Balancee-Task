import 'package:cash_track/bloc/cashout/cashout_bloc.dart';
import 'package:cash_track/core/splash_screen/splash_screen.dart';
import 'package:cash_track/services/database/cashback_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc/cashback/cashback_bloc.dart';
import 'bloc/cashback/cashback_event.dart';
import 'data/shared_preference_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  await CashBackDatabase.initialize();  // Initialize the database and add dummy data

  runApp(
      MultiBlocProvider(

      providers: [
        BlocProvider(
          create: (context) => CashbackBloc(isar: CashBackDatabase.getIsarInstance())..add(LoadAvailableCashbackEvent()),

        ),
        BlocProvider(
          create: (context) => CashoutBloc(),

        )
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Balanceè Rewards',
            home: SplashScreen(),
        ),
    );
  }
}
