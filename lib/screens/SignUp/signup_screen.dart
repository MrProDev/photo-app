import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itour_planner/commons/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const route = '/SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();

  final _validEmailRegex =
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  bool _isEmailValid = true;

  bool _isNameEmpty = false;
  bool _isUsernameEmpty = false;
  bool _isEmailEmpty = false;
  bool _isPasswordEmpty = false;
  bool _isPasswordConfirmEmpty = false;
  String _errorMessage = "";

  bool _loading = false;

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
      _isNameEmpty = _nameController.text.isEmpty;
      _isUsernameEmpty = _usernameController.text.isEmpty;
      _isPasswordConfirmEmpty = _confirmPasswordController.text.isEmpty;
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
            _buildNameTextField(),
            Visibility(
              replacement: const SizedBox(height: 30),
              visible: _isNameEmpty,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Name cannot be empty',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            _buildUserNameTextField(),
            Visibility(
              replacement: const SizedBox(height: 30),
              visible: _isUsernameEmpty,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Username cannot be empty',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
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
              replacement: const SizedBox(height: 30),
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
            _buildConfirmPasswordTextField(),
            Visibility(
              replacement: const SizedBox(height: 30),
              visible: _isPasswordConfirmEmpty,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Confirm Password cannot be empty',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameTextField() {
    return SizedBox(
      height: 40,
      width: 350,
      child: CupertinoTextField(
        prefix: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            CupertinoIcons.person_fill,
            color: AppColors.secondaryColor,
          ),
        ),
        suffix: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            CupertinoIcons.xmark_circle_fill,
            color: AppColors.primaryColor,
            size: 20,
          ),
          onPressed: () {
            _nameController.clear();
          },
        ),
        controller: _nameController,
        cursorColor: AppColors.secondaryColor,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.secondaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        placeholder: 'Name',
        keyboardType: TextInputType.name,
      ),
    );
  }

  Widget _buildUserNameTextField() {
    return SizedBox(
      height: 40,
      width: 350,
      child: CupertinoTextField(
        prefix: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.account_circle,
            color: AppColors.secondaryColor,
          ),
        ),
        suffix: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            CupertinoIcons.xmark_circle_fill,
            color: AppColors.primaryColor,
            size: 20,
          ),
          onPressed: () {
            _usernameController.clear();
          },
        ),
        controller: _usernameController,
        cursorColor: AppColors.secondaryColor,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.secondaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        placeholder: 'Username',
        keyboardType: TextInputType.name,
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
            replacement: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: AppColors.primaryColor,
                size: 20,
              ),
              onPressed: () {
                _emailController.clear();
              },
            ),
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
              color: AppColors.secondaryColor,
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
          suffix: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: AppColors.primaryColor,
              size: 20,
            ),
            onPressed: () {
              _passwordController.clear();
            },
          ),
          controller: _passwordController,
          cursorColor: AppColors.secondaryColor,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.secondaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          placeholder: 'Password',
          obscureText: true,
        ),
      );

  Widget _buildConfirmPasswordTextField() => SizedBox(
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
          suffix: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: AppColors.primaryColor,
              size: 20,
            ),
            onPressed: () {
              _confirmPasswordController.clear();
            },
          ),
          controller: _confirmPasswordController,
          cursorColor: AppColors.secondaryColor,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.secondaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          placeholder: 'Confirm Password',
          obscureText: true,
        ),
      );

  Widget _buildSignUpButton() => CupertinoButton(
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
                setState(() {
                  _loading = true;
                });
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
                'Sign Up',
              ),
      );
}
