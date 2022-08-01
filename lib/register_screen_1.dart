import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo/register_screen_2.dart';

class RegisterScreen1 extends StatefulWidget {
  const RegisterScreen1({super.key});

  static const route = '/RegisterScreen1';

  @override
  State<RegisterScreen1> createState() => _RegisterScreen1State();
}

class _RegisterScreen1State extends State<RegisterScreen1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        margin: const EdgeInsets.only(
          top: 100,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            GestureDetector(
              child: Image.asset(
                'assets/Icons/back.png',
                color: CupertinoColors.black,
              ),
              onTap: () => Navigator.pop(context),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 40,
                bottom: 30,
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 36,
                ),
              ),
            ),
            SizedBox(
              height: 52,
              child: CupertinoTextField(
                controller: _emailController,
                placeholder: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                textAlignVertical: TextAlignVertical.center,
                padding: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.black, width: 2),
                ),
              ),
            ),
            Container(
              height: 52,
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 30,
              ),
              child: CupertinoTextField(
                controller: _passController,
                placeholder: 'Password',
                obscureText: true,
                textAlignVertical: TextAlignVertical.center,
                padding: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.black, width: 2),
                ),
              ),
            ),
            Container(
              height: 52,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: CupertinoColors.white,
                  backgroundColor: CupertinoColors.black,
                ),
                onPressed: () => Navigator.pushNamed(context, RegisterScreen2.route),
                child: const Text(
                  'NEXT',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
