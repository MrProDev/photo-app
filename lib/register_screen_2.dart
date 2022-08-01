import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen2 extends StatefulWidget {
  const RegisterScreen2({super.key});

  static const route = '/RegisterScreen2';

  @override
  State<RegisterScreen2> createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
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
                controller: _usernameController,
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
                top: 30,
              ),
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
                  'SIGN UP',
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
