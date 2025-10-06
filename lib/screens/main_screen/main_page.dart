import 'package:flutter/material.dart';
// تأكد من أن هذا المسار صحيح
import 'package:project/screens/main_screen/stadium_details.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override Widget build(BuildContext context) {
    final List<Map<String, String>> stadiums = [
      {'name': 'Al-Siteen Stadium', 'price': '\$100 / hour', 'image': 'assets/images/stadiums/1.png'},
      {'name': 'Al-Amoudi Stadium', 'price': '\$15 / hour', 'image': 'assets/images/stadiums/2.png'},
      {'name': 'Al-Siteen Stadium', 'price': '\$100 / hour', 'image': 'assets/images/stadiums/3.png'},
      {'name': 'Al-Amoudi Stadium', 'price': '\$15 / hour', 'image': 'assets/images/stadiums/4.png'},
      {'name': 'Al-Siteen Stadium', 'price': '\$100 / hour', 'image': 'assets/images/stadiums/5.png'},
      {'name': 'Al-Amoudi Stadium', 'price': '\$15 / hour', 'image': 'assets/images/stadiums/6.png'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF319710),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // --- شريط البحث العلوي ---
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 10, 18, 10),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.settings_input_component_rounded, color: Color(0xFF319610)),
                  ),
                  const SizedBox(width: 27),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                        color: Color(0xFF319610),
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          color: Color(0xFF319610),
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: const Icon(Icons.search, color: Color(0xFF319610)),
                        contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- محتوى الصفحة الأبيض ---
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  padding: const EdgeInsets.all(19.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 22,
                    childAspectRatio: 0.82,
                  ),
                  itemCount: stadiums.length,
                  itemBuilder: (context, index) {
                    final stadium = stadiums[index];
                    return GestureDetector(
                      onTap: () {
                        // --- تم الإصلاح هنا: تمرير البيانات إلى صفحة التفاصيل ---
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StadiumDetailsPage(
                              name: stadium['name']!,
                              price: stadium['price']!,
                              imageUrl: stadium['image']!,
                            ),
                          ),
                        );
                      },
                      child: StadiumCard(
                        name: stadium['name']!,
                        price: stadium['price']!,
                        imageUrl: stadium['image']!,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- ويدجت مخصص لبطاقة الملعب (لا تغيير هنا) ---
class StadiumCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const StadiumCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF319610),
            blurRadius: 15.20,
            offset: Offset(0, 6),
            spreadRadius: -2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                imageUrl,
                height: 101,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 101,
                    color: Colors.grey[200],
                    child: const Icon(Icons.error, color: Colors.red),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF225022),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF329711),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
