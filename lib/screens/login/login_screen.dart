import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itour_planner/commons/colors.dart';
import 'package:itour_planner/firebase/auth_api.dart';
import 'package:itour_planner/firebase/google_signin.dart';
import 'package:itour_planner/screens/SignUp/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const route = '/loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _validEmailRegex =
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

  bool _isEmailValid = true;
  bool _isPasswordEmpty = false;
  bool _isEmailEmpty = false;

  String _errorMessage = "";

  bool _loading = false;

  bool _userExists = true;

  void _validateFields() {
    setState(() {
      _isEmailValid = _validEmailRegex.hasMatch(_emailController.text);
      _isEmailEmpty = _emailController.text.isEmpty;
      !_isEmailEmpty
          ? _isEmailValid
              ? _errorMessage = ''
              : _errorMessage = 'The email is not a valid email address'
          : _errorMessage = 'Email cannot be empty';

      _isPasswordEmpty = _passwordController.text.isEmpty;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 150),
            SizedBox(
              child: Image.asset(
                'assets/commons/primary_logo.png',
                width: 75,
                height: 75,
              ),
            ),
            const SizedBox(height: 30),
            // CupertinoSlidingSegmentedControl<int>(
            //   groupValue: _selectSegment,
            //   onValueChanged: (value) {
            //     setState(() {
            //       _selectSegment = value!;
            //     });
            //   },
            //   children: {
            //     0: Container(
            //       alignment: Alignment.center,
            //       padding:
            //           const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //       child: const Text('Login'),
            //     ),
            //     1: Container(
            //       alignment: Alignment.center,
            //       padding:
            //           const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //       child: const Text('Sign Up'),
            //     ),
            //   },
            // ),
            _buildEmailTextField(),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                _errorMessage,
                style: const TextStyle(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            _buildPasswordTextField(),
            Visibility(
              visible: _isPasswordEmpty,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Password cannot be empty',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            _buildLoginButton(),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'OR',
                style: TextStyle(
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ),
            _buildGoogleSignIn(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account yet?',
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                  ),
                ),
                const SizedBox(width: 10),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, SignUpScreen.route),
                ),
              ],
            ),

            _buildAnonymousSignIn(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField() => SizedBox(
        height: 40,
        width: 350,
        child: CupertinoTextField(
          prefix: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              CupertinoIcons.mail,
              color: AppColors.secondaryColor,
            ),
          ),
          suffix: Visibility(
            visible: !_isEmailValid,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.error,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          controller: _emailController,
          cursorColor: AppColors.secondaryColor,
          decoration: BoxDecoration(
            border: Border.all(
              color: !_userExists
                  ? AppColors.primaryColor
                  : AppColors.secondaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          placeholder: 'Email Address or Phone Number',
          keyboardType: TextInputType.emailAddress,
        ),
      );

  Widget _buildPasswordTextField() => SizedBox(
        height: 40,
        width: 350,
        child: CupertinoTextField(
          prefix: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              CupertinoIcons.lock,
              color: AppColors.secondaryColor,
            ),
          ),
          controller: _passwordController,
          cursorColor: AppColors.secondaryColor,
          decoration: BoxDecoration(
            border: Border.all(
              color: !_userExists
                  ? AppColors.primaryColor
                  : AppColors.secondaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          placeholder: 'Password',
          obscureText: true,
        ),
      );

  Widget _buildLoginButton() => CupertinoButton(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        borderRadius: BorderRadius.circular(5),
        color: AppColors.secondaryColor,
        disabledColor: AppColors.secondaryColor,
        onPressed: _loading
            ? null
            : () async {
                _validateFields();
                final authApi = Provider.of<AuthApi>(context, listen: false);
                setState(() {
                  _loading = true;
                });
                User? user = await authApi.signInWithEmailAndPassword(
                  _emailController.text.trim(),
                  _passwordController.text,
                );
                if (user == null) {
                  setState(() {
                    _userExists = false;
                  });
                } else {
                  setState(() {
                    _userExists = true;
                  });
                }
                setState(() {
                  _loading = false;
                });
              },
        child: _loading
            ? const CupertinoActivityIndicator(
                radius: 16,
                animating: true,
              )
            : const Text(
                'Log in',
              ),
      );

  Widget _buildGoogleSignIn() => CupertinoButton(
        onPressed: () {
          final provider = Provider.of<GoogleSignInApi>(context, listen: false);
          provider.googleLogin();
        },
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        color: AppColors.secondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/google.svg',
              height: 32,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
              ),
              child: const Text(
                'Log in with Google',
              ),
            ),
          ],
        ),
      );

  Widget _buildAnonymousSignIn() => CupertinoButton(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        borderRadius: BorderRadius.circular(5),
        disabledColor: AppColors.secondaryColor,
        onPressed: () async {
          final authApi = Provider.of<AuthApi>(context, listen: false);
          await authApi.anonymousSignIn();
        },
        child: const Text(
          'May be later',
          style: TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
      );
}
