import 'package:flutter/material.dart';
import 'package:project/screens/Booking/Booking.dart';
import 'package:project/screens/main_screen/Widget/detailCard.dart';

class StadiumDetailsPage extends StatelessWidget {
  // 1. إضافة المتغيرات لاستقبال البيانات
  final String name;
  final String price;
  final int capacity;
  final String location;
  final TimeOfDay startDate;
  final TimeOfDay endDate;
  final String imageUrl;

  // 2. تحديث الـ constructor ليكون مطلوبًا
  const StadiumDetailsPage({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.capacity,
    required this.location,
    required this.startDate,
    required this.endDate,
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
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
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
                        fontSize: 28,

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
                        child: Image.asset(
                          // تم التغيير إلى Image.asset بما أن الصور محلية
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
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x21D8D8D8),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFFE9E9E9),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            // 3. استخدام اسم الملعب في التفاصيل
                            Text(
                              '$name Details',
                              style: const TextStyle(
                                color: Color(0xFF135F23),
                                fontSize: 18,

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
                                  text: '$capacity Players in Team',
                                ),
                                DetailCard(
                                  icon: Icons.date_range,
                                  text:
                                      '${startDate.hour}:${startDate.minute} - ${endDate.hour}:${endDate.minute}',
                                ),
                                DetailCard(
                                  icon: Icons.location_on,
                                  text: location,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Booking(name: name, image: imageUrl),
                            ),
                          );
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Booking(
                          //       name: 'Al-Siteen Stadium',
                          //       image: 'assets/images/stadiums/1.png',
                          //     ),
                          //   ),
                          // );
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Booking(
                          //       name: 'Al-Amoudi Stadium',
                          //       image: 'assets/images/stadiums/2.png',
                          //     ),
                          //   ),
                          // );
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Booking(
                          //       name: 'Al-Shafei Stadium',
                          //       image: 'assets/images/stadiums/3.png',
                          //     ),
                          //   ),
                          // );
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Booking(
                          //       name: 'Al-Amoudi Stadium',
                          //       image: 'assets/images/stadiums/6.png',
                          //     ),
                          //   ),
                          // );
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Booking(
                          //       name: 'Al-Monash Stadium',
                          //       image: 'assets/images/stadiums/5.png',
                          //     ),
                          //   ),
                          // );
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
                            fontSize: 18,

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
