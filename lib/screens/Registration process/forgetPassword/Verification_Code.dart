import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart'; // 1. استيراد مكتبة pinput
import 'package:ArenaBook/screens/Registration%20process/forgetPassword/Reset_Password.dart'; // استيراد صفحة إعادة تعيين كلمة المرور

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 2. تصميم Pinput الافتراضي والمخصص
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 16,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFC7F6B8),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF319710),
      body: SafeArea(
        child: Column(
          children: [
            // 3. شريط العنوان العلوي
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
                          'Verification Code',
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
            // 4. الحاوية البيضاء الرئيسية
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50.0,
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
                    children: [
                      // صورة توضيحية
                      Image.asset(
                        'assets/images/Registration/F2.png', // استخدمت نفس الصورة من الصفحة السابقة
                        height: 180,
                      ),
                      const SizedBox(height: 25),
                      // نص توضيحي
                      const Text(
                        'Please confirm the security code received on your registered email:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF1D5F08),
                          fontSize: 16,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 30),
                      // 5. استخدام Pinput لإدخال الكود
                      Pinput(
                        length: 6, // عدد خانات الكود
                        controller: pinController,
                        focusNode: focusNode,
                        defaultPinTheme: defaultPinTheme,
                        separatorBuilder: (index) => const SizedBox(width: 8),
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            border: Border.all(color: const Color(0xFF319710)),
                          ),
                        ),
                        onCompleted: (pin) {
                          // يمكنك إضافة منطق التحقق هنا عند اكتمال الإدخال
                          print('Pin completed: $pin');
                        },
                      ),
                      const SizedBox(height: 40),
                      // 6. زر التأكيد
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            // الانتقال لصفحة إعادة تعيين كلمة المرور
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ResetPasswordPage(),
                              ),
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
                            'Confirm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // 7. رابط إعادة إرسال الكود (مع التعديل)
                      Text.rich(
                        TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'inter',
                            color: Color(0xFF391713),
                          ),
                          children: [
                            const TextSpan(
                              text: "Didn't receive the code? \n",
                            ), // <-- تم التعديل هنا
                            TextSpan(
                              text: 'Send Again',
                              style: const TextStyle(
                                color: Color(0xFF319710),
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // أضف هنا منطق إعادة إرسال الكود
                                  print('Resend code tapped');
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
}
