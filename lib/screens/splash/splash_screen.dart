import 'package:flutter/cupertino.dart';
import 'package:itour_planner/commons/colors.dart';
import 'package:itour_planner/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(
        context,
        MainPage.route,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.primaryColor,
      child: Center(
        child: Image.asset(
          'assets/commons/white_logo.png',
          width: 100,
        ),
      ),
    );
  }
}
