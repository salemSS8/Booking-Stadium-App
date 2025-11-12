import 'package:flutter/material.dart';
import '../../models/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFF319710),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Stack(
        children: [
          // الصورة العلوية (تأخذ 60% من الشاشة)
          Positioned(
            left: -5,
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width + 10,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(model.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // الخلفية البيضاء السفلية
          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height * 0.57,
            bottom: 0,
            child: Container(
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(39),
                    topRight: Radius.circular(33),
                  ),
                ),
              ),
            ),
          ),

          // العنوان - معدل للمركز
          Positioned(
            left: 0, // تغيير من 54 إلى 0
            right: 0, // تغيير من 54 إلى 0
            top: MediaQuery.of(context).size.height * 0.68,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ), // إضافة padding جانبي
              child: Text(
                model.title,
                textAlign: TextAlign.center, // تأكد من أن النص في المنتصف
                style: const TextStyle(
                  color: Color(0xFF319610),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          // الوصف - معدل للمركز
          Positioned(
            left: 0, // تغيير من 38 إلى 0
            right: 0, // تغيير من 38 إلى 0
            top: MediaQuery.of(context).size.height * 0.73,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ), // إضافة padding جانبي
              child: Text(
                model.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF319610),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
