import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import '../../models/user.dart';
import '../../services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  bool _isPasswordVisible = false;

  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _phoneError;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  TextStyle _labelStyle() => const TextStyle(
    color: Color(0xFF163913),
    fontSize: 16,
    fontFamily: 'inter',
    fontWeight: FontWeight.w500,
  );

  InputDecoration _inputDecoration(String hint) => InputDecoration(
    filled: true,
    fillColor: const Color(0xFFC7F6B8),
    hintText: hint,
    hintStyle: const TextStyle(
      color: Color(0xFF163913),
      fontSize: 14,
      fontFamily: 'inter',
      fontWeight: FontWeight.w400,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 12.0,
      horizontal: 16.0,
    ),
  );

  void _validateName() {
    final v = _nameCtrl.text.trim();
    setState(() {
      if (v.isEmpty)
        _nameError = 'This field is required';
      else if (v.length < 3)
        _nameError = 'Full name must be at least 3 characters';
      else
        _nameError = null;
    });
  }

  void _validateEmail() {
    final v = _emailCtrl.text.trim();
    final emailRegex = RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}");
    setState(() {
      if (v.isEmpty)
        _emailError = 'This field is required';
      else if (!emailRegex.hasMatch(v))
        _emailError = 'Please enter a valid email';
      else
        _emailError = null;
    });
  }

  void _validatePassword() {
    final v = _passwordCtrl.text;
    setState(() {
      if (v.isEmpty)
        _passwordError = 'This field is required';
      else if (v.length < 6)
        _passwordError = 'Password must be at least 6 characters';
      else
        _passwordError = null;
    });
  }

  void _validatePhone() {
    final v = _phoneCtrl.text.trim();
    final digitsOnly = RegExp(r'^[0-9]+$');
    setState(() {
      if (v.isEmpty)
        _phoneError = 'This field is required';
      else if (!digitsOnly.hasMatch(v))
        _phoneError = 'Only numbers are allowed';
      else if (v.length < 9)
        _phoneError = 'Mobile number must be at least 9 digits';
      else
        _phoneError = null;
    });
  }

  Future<void> _onSubmit() async {
    _validateName();
    _validateEmail();
    _validatePassword();
    _validatePhone();

    if (_nameError == null &&
        _emailError == null &&
        _passwordError == null &&
        _phoneError == null) {
      final user = User(
        fullName: _nameCtrl.text.trim(),
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text,
        phone: _phoneCtrl.text.trim(),
      );

      await AuthService.signUp(user);

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF319710),
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          children: [
            // top bar
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 25.0,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(right: 24.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xFFF8F8F8),
                            fontSize: 28,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // form container
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 30.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Full name
                      Text('Full name:', style: _labelStyle()),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _nameCtrl,
                        decoration: _inputDecoration('User Name'),
                        onChanged: (_) => _validateName(),
                      ),
                      if (_nameError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            _nameError!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      const SizedBox(height: 16),

                      // Password
                      Text('Password:', style: _labelStyle()),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _passwordCtrl,
                        obscureText: !_isPasswordVisible,
                        decoration: _inputDecoration('Password').copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () => setState(
                              () => _isPasswordVisible = !_isPasswordVisible,
                            ),
                          ),
                        ),
                        onChanged: (_) => _validatePassword(),
                      ),
                      if (_passwordError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            _passwordError!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      const SizedBox(height: 16),

                      // Email
                      Text('Email:', style: _labelStyle()),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: _inputDecoration('example@email.com'),
                        onChanged: (_) => _validateEmail(),
                      ),
                      if (_emailError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            _emailError!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      const SizedBox(height: 16),

                      // Mobile
                      Text('Mobile Number:', style: _labelStyle()),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _phoneCtrl,
                        keyboardType: TextInputType.phone,
                        decoration: _inputDecoration('Enter your phone number'),
                        onChanged: (_) => _validatePhone(),
                      ),
                      if (_phoneError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            _phoneError!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),

                      const SizedBox(height: 20),

                      // Sign Up button
                      ElevatedButton(
                        onPressed: _onSubmit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF319710),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Terms
                      Center(
                        child: Column(
                          children: [
                            Text.rich(
                              TextSpan(
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'inter',
                                  color: Color(0xFF391713),
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'By continuing, you agree to\n ',
                                  ),
                                  TextSpan(
                                    text: 'Terms of Use',
                                    style: const TextStyle(
                                      color: Color(0xFF319710),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () =>
                                          debugPrint('Terms tapped'),
                                  ),
                                  const TextSpan(text: ' and '),
                                  TextSpan(
                                    text: 'Privacy Policy.',
                                    style: const TextStyle(
                                      color: Color(0xFF319710),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () =>
                                          debugPrint('Privacy tapped'),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'or sign up with',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF391713),
                                fontSize: 14,
                                fontFamily: 'inter',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialMediaIcon(
                            imagePath:
                                'assets/images/Registration/google_icon.png',
                          ),
                          const SizedBox(width: 20),
                          _socialMediaIcon(
                            imagePath:
                                'assets/images/Registration/facebook_icon.png',
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      Center(
                        child: Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'inter',
                              color: Color(0xFF391713),
                            ),
                            children: [
                              const TextSpan(text: 'Already have an account? '),
                              TextSpan(
                                text: 'Log in',
                                style: const TextStyle(
                                  color: Color(0xFF319710),
                                  fontWeight: FontWeight.w500,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.of(context).pop(),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialMediaIcon({required String imagePath}) {
    return Container(
      width: 45,
      height: 45,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: const Color(0xFFC7F6B8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      ),
      child: Image.asset(imagePath),
    );
  }
}
