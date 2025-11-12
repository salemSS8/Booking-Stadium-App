import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/main_screen/main_page.dart';

// 1. تحويل الويدجت إلى StatefulWidget
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // 2. إضافة متغير لتتبع حالة رؤية كلمة المرور
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
            // شريط العنوان العلوي
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

            // الحاوية البيضاء الرئيسية للنموذج
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
                      // حقول الإدخال
                      _buildTextField(label: 'Full name:', hint: 'User Name'),
                      // استدعاء حقل كلمة المرور
                      _buildTextField(
                        label: 'Password:',
                        hint: 'Password',
                        isPassword: true,
                      ),
                      _buildTextField(
                        label: 'Email:',
                        hint: 'example@email.com',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      _buildTextField(
                        label: 'Mobile Number:',
                        hint: 'Enter your phone number',
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 20),

                      // نص الشروط والسياسات
                      Text.rich(
                        TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'League Spartan',
                            color: Color(0xFF391713),
                          ),
                          children: [
                            const TextSpan(
                              text: 'By continuing, you agree to \n ',
                            ),
                            TextSpan(
                              text: 'Terms of Use',
                              style: const TextStyle(
                                color: Color(0xFF319710),
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Terms of Use Tapped');
                                },
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: const TextStyle(
                                color: Color(0xFF319710),
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Privacy Policy Tapped');
                                },
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),

                      // زر إنشاء الحساب
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                          /* منطق إنشاء الحساب هنا */
                        },
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
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // نص "or sign up with"
                      const Text(
                        'or sign up with',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF391713),
                          fontSize: 12,
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // أيقونات التواصل الاجتماعي
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

                      // رابط تسجيل الدخول
                      Text.rich(
                        TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'League Spartan',
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
                                ..onTap = () {
                                  Navigator.of(context).pop();
                                },
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
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

  // 3. تعديل دالة بناء حقل النص
  Widget _buildTextField({
    required String label,
    required String hint,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF163913),
            fontSize: 16,
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          // obscureText: isPassword, // استبدال هذا السطر
          obscureText: isPassword
              ? !_isPasswordVisible
              : false, // إخفاء النص فقط إذا كان حقل كلمة مرور وغير مرئي
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFC7F6B8),
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color(0xFF163913),
              fontSize: 16,
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
            ),
            // suffixIcon: isPassword ? const Icon(Icons.visibility_off, color: Colors.grey) : null, // استبدال هذا السطر
            suffixIcon: isPassword
                ? IconButton(
                    // تحويل الأيقونة إلى زر قابل للنقر
                    icon: Icon(
                      // تغيير شكل الأيقونة بناءً على الحالة
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // تحديث الحالة عند النقر على الأيقونة
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                : null, // لا تظهر أيقونة إذا لم يكن حقل كلمة مرور
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
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
