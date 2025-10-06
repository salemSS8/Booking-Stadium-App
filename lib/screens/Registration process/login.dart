import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/Registration process/signUp.dart';
import '../main_screen/main_page.dart';
import 'forgetPassword/Inter_Email.dart';

// 1. تحويل الويدجت إلى StatefulWidget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 2. إضافة متغير حالة لرؤية كلمة المرور
  bool _isPasswordVisible = false;

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
            // الجزء العلوي الأخضر
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
              child: Row(
                children: [
                  //
                  const SizedBox(width: 10),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 34.0),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFFF8F8F8),
                            fontSize: 28,
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // الحاوية البيضاء الرئيسية
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          color: Color(0xFF319710),
                          fontSize: 24,
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Create Your YumRush Account Join thousands enjoying fast, fresh meals delivered right to their door. Sign up or Log in now and let the cravings begin!',
                        style: TextStyle(
                          color: Color(0xFF1D5F08),
                          fontSize: 16,
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w300,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 40),

                      // حقل البريد الإلكتروني
                      const Text(
                        'Email or Mobile Number:',
                        style: TextStyle(
                          color: Color(0xFF163913),
                          fontSize: 20,
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFC7F5B8),
                          hintText: 'example@email.com',
                          hintStyle: const TextStyle(
                            color: Color(0xFF163913),
                            fontSize: 20,
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // حقل كلمة المرور
                      const Text(
                        'Password:',
                        style: TextStyle(
                          color: Color(0xFF163913),
                          fontSize: 20,
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // --- 3. تفعيل أيقونة كلمة المرور ---
                      TextField(
                        obscureText: !_isPasswordVisible, // ربط الإخفاء بالحالة
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFC7F5B8),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Color(0xFF163913),
                            fontSize: 20,
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w400,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // تحديث الحالة عند النقر
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // --- 4. تفعيل زر "forget password" ---
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // الانتقال إلى صفحة InterEmailPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const InterEmailPage()),
                            );
                            print('Navigating to Forget Password page...');
                          },
                          child: Text(
                            'forget password',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF319710),
                              fontSize: 14,
                              fontFamily: 'League Spartan',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline, // اختياري: لتمييزه كرابط
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),

                      // زر تسجيل الدخول
                      Center(
                        child: SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            // --- 2. تعديل هذا الجزء ---
                            onPressed: () {
                              // منطق تسجيل الدخول
                              // استبدال الصفحة الحالية بالصفحة الرئيسية
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const MainPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF319710),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // قسم التسجيل عبر وسائل التواصل الاجتماعي
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'or sign up with',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF252525),
                            fontSize: 14,
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialMediaIcon(
                            imagePath: 'assets/images/Registration/google_icon.png',
                            onTap: () {
                              print('Google Sign-In Tapped');
                            },
                          ),
                          const SizedBox(width: 20),
                          _socialMediaIcon(
                            imagePath: 'assets/images/Registration/facebook_icon.png',
                            onTap: () {
                              print('Facebook Sign-In Tapped');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // رابط التسجيل
                      Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Don’t have an account? ',
                                style: TextStyle(
                                  color: Color(0xFF391713),
                                  fontSize: 14,
                                  fontFamily: 'League Spartan',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                style: const TextStyle(
                                  color: Color(0xFF319710),
                                  fontSize: 14,
                                  fontFamily: 'League Spartan',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                                    );
                                    print('Navigating to Sign Up page...');
                                  },
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
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

  Widget _socialMediaIcon({required String imagePath, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 45,
        height: 45,
        decoration: ShapeDecoration(
          color: const Color(0xFFC7F6B8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: Image.asset(
          imagePath,
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}
