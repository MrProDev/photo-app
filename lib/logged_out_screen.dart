import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo/login_screen.dart';
import 'package:photo/register_screen.dart';

class LoggedOutScreen extends StatelessWidget {
  const LoggedOutScreen({super.key});

  static const route = '/LoggedOutScreen';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/loggedout/loggedout.png',
                fit: BoxFit.fill,
                width: size.width,
                height: size.height - 100,
              ),
              Positioned(
                top: size.height / 2.75,
                left: size.width / 4,
                child: Image.asset(
                  'assets/splash/splash.png',
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 52,
                  width: 167,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CupertinoColors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: CupertinoColors.black,
                      backgroundColor: CupertinoColors.white,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, LoginScreen.route),
                    child: const Text(
                      'LOG IN',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 52,
                  width: 167,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: CupertinoColors.white,
                      backgroundColor: CupertinoColors.black,
                    ),
                    onPressed: () => Navigator.pushNamed(context, RegisterScreen.route),
                    child: const Text(
                      'REGISTER',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
