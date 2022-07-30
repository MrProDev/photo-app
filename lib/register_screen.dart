import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const route = '/RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: Image.asset(
                'assets/Icons/back.png',
                color: CupertinoColors.black,
              ),
              onPressed: () => Navigator.pop(context),
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
                onPressed: () {},
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
