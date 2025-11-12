import 'package:flutter/material.dart';

// 1. تحويل الويدجت إلى StatefulWidget لإدارة حالة رؤية كلمة المرور
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  // متغيرات لتتبع حالة رؤية كلمتي المرور
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // يمنع تغيير حجم الواجهة عند ظهور لوحة المفاتيح
      backgroundColor: const Color(0xFF319710), // اللون الأخضر للخلفية
      body: SafeArea(
        top: true,
        bottom: false, // لمنع ترك مسافة خضراء في الأسفل
        child: Column(
          children: [
            // 1. شريط العنوان العلوي مع أيقونة الرجوع
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 25.0,
              ),
              child: Row(
                children: [
                  // أيقونة الرجوع
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pop(), // للرجوع للشاشة السابقة
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                  // عنوان الصفحة في المنتصف
                  const Expanded(
                    child: Center(
                      child: Padding(
                        // تعويض مساحة السهم للحفاظ على التوسيط
                        padding: EdgeInsets.only(right: 24.0),
                        child: Text(
                          'Reset Password',
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

            // 2. الحاوية البيضاء الرئيسية للنموذج
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
                      const SizedBox(height: 20),
                      // أيقونة توضيحية
                      const Icon(
                        Icons.lock_open,
                        size: 80,
                        color: Color(0xFF319710),
                      ),
                      const SizedBox(height: 25),

                      // نص توضيحي
                      const Text(
                        'Create a new password for your account.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF1D5F08),
                          fontSize: 16,
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 40),

                      // حقل إدخال كلمة المرور الجديدة
                      _buildPasswordField(
                        label: 'New Password:',
                        hint: 'Enter new password',
                        isPasswordVisible: _isNewPasswordVisible,
                        onToggleVisibility: () {
                          setState(() {
                            _isNewPasswordVisible = !_isNewPasswordVisible;
                          });
                        },
                      ),

                      // حقل تأكيد كلمة المرور الجديدة
                      _buildPasswordField(
                        label: 'Confirm Password:',
                        hint: 'Confirm your password',
                        isPasswordVisible: _isConfirmPasswordVisible,
                        onToggleVisibility: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                      const SizedBox(height: 50),

                      // زر التأكيد
                      ElevatedButton(
                        onPressed: () {
                          // أضف هنا منطق إعادة تعيين كلمة المرور
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF319710),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Create New Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w600,
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

  // دالة مساعدة لإنشاء حقول كلمة المرور
  Widget _buildPasswordField({
    required String label,
    required String hint,
    required bool isPasswordVisible,
    required VoidCallback onToggleVisibility,
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
          obscureText: !isPasswordVisible, // التحكم في إخفاء النص
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
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: onToggleVisibility, // استدعاء الدالة عند النقر
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none, // إزالة الحدود
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
          ),
        ),
        const SizedBox(height: 25), // مسافة بعد كل حقل
      ],
    );
  }
}
