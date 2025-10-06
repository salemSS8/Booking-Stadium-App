import 'package:flutter/material.dart';

class StadiumDetailsPage extends StatelessWidget {
  // 1. إضافة المتغيرات لاستقبال البيانات
  final String name;
  final String price;
  final String imageUrl;

  // 2. تحديث الـ constructor ليكون مطلوبًا
  const StadiumDetailsPage({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF319710),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // --- الشريط العلوي ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    // 3. استخدام اسم الملعب الذي تم تمريره
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFF8F8F8),
                        fontSize: 26,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // لموازنة حجم زر الرجوع
                ],
              ),
            ),

            // --- المحتوى الرئيسي القابل للتمرير ---
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // --- صورة الملعب ---
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        // 3. استخدام صورة الملعب التي تم تمريرها
                        child: Image.asset( // تم التغيير إلى Image.asset بما أن الصور محلية
                          imageUrl,
                          height: 277,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 277,
                              color: Colors.grey[200],
                              child: const Icon(Icons.error, color: Colors.red),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 25),

                      // --- صندوق التفاصيل ---
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: const Color(0x21D8D8D8),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFFE9E9E9), width: 1),
                        ),
                        child: Column(
                          children: [
                            // 3. استخدام اسم الملعب في التفاصيل
                            Text(
                              '$name Details',
                              style: const TextStyle(
                                color: Color(0xFF135F23),
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 15),
                            GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 1.8,
                              children: [
                                // --- تم التعديل هنا لاستخدام أيقونات Flutter ---
                                DetailCard(
                                  icon: Icons.money_outlined,
                                  text: price,
                                ),
                                DetailCard(
                                  icon: Icons.stadium,
                                  text: '11 Players in Team',
                                ),
                                DetailCard(
                                  icon: Icons.date_range,
                                  text: '8:00 - 23:00',
                                ),
                                DetailCard(
                                  icon: Icons.location_on,
                                  text: 'Mukalla 3A',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // --- زر الحجز ---
                      ElevatedButton(
                        onPressed: () {
                          print('Book button for $name tapped');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF319710),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Book',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Poppins',
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
}

// --- ويدجت مساعد لبطاقات التفاصيل (تم تعديله) ---
class DetailCard extends StatelessWidget {
  // تم تغيير النوع من String إلى IconData
  final IconData icon;
  final String text;

  const DetailCard({
    super.key,
    required this.icon, // تحديث اسم المتغير
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // استخدام الأيقونة التي تم تمريرها مباشرة
          Icon(icon, size: 32, color: const Color(0xFF135F23)),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF4C4C4C),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
