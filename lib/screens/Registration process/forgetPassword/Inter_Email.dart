import 'package:flutter/material.dart';
// --- الخطوة 1: استيراد ملف صفحة التحقق ---
import 'package:project/screens/Registration process/forgetPassword/verification_Code.dart';

class InterEmailPage extends StatelessWidget {
  const InterEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // يمنع تغيير حجم الواجهة عند ظهور لوحة المفاتيح
      backgroundColor: const Color(0xFF319710), // اللون الأخضر للخلفية
      body: SafeArea(
        top: true,
        bottom: false, // لمنع ترك مسافة خضراء في الأسفل
        child: Column(
          children: [
            // شريط العنوان العلوي مع أيقونة الرجوع
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
              child: Row(
                children: [
                  // أيقونة الرجوع
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(), // للرجوع للشاشة السابقة
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
                          'Email', // عنوان أكثر وضوحاً
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      // صورة توضيحية
                      Image.asset(
                        'assets/images/Registration/F1.png', // تأكد من أن المسار صحيح
                        height: 250, // يمكنك تعديل الارتفاع حسب تصميم الصورة
                      ),

                      // حقل إدخال البريد الإلكتروني
                      _buildTextField(
                        label: 'Email:',
                        hint: 'example@email.com',
                        keyboardType: TextInputType.emailAddress,
                      ),

                      // حقل إدخال رقم الهاتف
                      _buildTextField(
                        label: 'Mobile Number:',
                        hint: 'Enter your phone number',
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 50),

                      // --- الجزء الذي تم تعديله ---
                      // زر التأكيد
                      Center( // للحفاظ على الزر في المنتصف
                        child: SizedBox(
                          width: 200, // تحديد عرض أصغر للزر
                          child: ElevatedButton(
                            onPressed: () {
                              // عند النقر، انتقل إلى صفحة كود التحقق
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const VerificationCodePage()),
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
                                fontSize: 24,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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

  // دالة مساعدة لإنشاء حقول الإدخال لتجنب تكرار الكود
  Widget _buildTextField({
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF163913),
            fontSize: 20,
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFC7F6B8),
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color(0xFF163913),
              fontSize: 18,
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none, // إزالة الحدود
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
        const SizedBox(height: 25), // مسافة بعد كل حقل
      ],
    );
  }
}
