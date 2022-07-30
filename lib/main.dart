import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo/logged_out_screen.dart';
import 'package:photo/login_screen.dart';
import 'package:photo/register_screen.dart';
import 'package:photo/splash_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => CupertinoApp(
        theme: const CupertinoThemeData(
          brightness: Brightness.light,
          
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (p0) => const SplashScreen(),
          LoggedOutScreen.route: (p0) => const LoggedOutScreen(),
          LoginScreen.route:(p0) => const LoginScreen(),
          RegisterScreen.route:(p0) => const RegisterScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
