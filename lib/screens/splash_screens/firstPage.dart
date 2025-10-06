import 'package:flutter/material.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. استخدام لون الخلفية الخاص بالعلامة التجارية
      backgroundColor: const Color(0xFFFDFDFD),

      // 2. استخدام ويدجت `Center` لتوسيط المحتوى بسهولة
      body: Center(
        // 3. وضع الشعار مباشرة داخل Center
        child: Image.asset(
          'assets/images/logo/logo.png',

          // تحديد عرض مناسب للشعار، مما يجعله يتكيف مع الشاشات المختلفة
          width: 350,

          // إضافة errorBuilder لمعرفة ما إذا كان مسار الصورة خاطئًا
          errorBuilder: (context, error, stackTrace) {
            // في حالة عدم العثور على الصورة، سيظهر مربع أحمر لمساعدتك على تصحيح الخطأ
            return Container(
              width: 250,
              height: 250,
              color: Colors.red.withOpacity(0.1),
              child: const Center(
                child: Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
