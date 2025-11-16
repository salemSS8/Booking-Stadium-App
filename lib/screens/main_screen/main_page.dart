import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/Favorites/favorites_page.dart';
import 'package:project/screens/My%20Reservations%20page/My%20Reservations%20page.dart';
import 'package:project/screens/about_Program/about_program.dart';
import 'package:project/screens/main_screen/Widget/stadiumCard.dart';
import 'package:project/screens/main_screen/stadium_data.dart';
// تأكد من أن هذا المسار صحيح
import 'package:project/screens/main_screen/stadium_details.dart';
import 'package:project/screens/notifications_page/notifications_page.dart';
import 'package:project/screens/payment_history/payment_history_page.dart';
import 'package:project/screens/profile/Profile.dart';

import '../Registration process/login.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // يغلق عند الضغط خارج المربع
      barrierColor: Colors.black.withOpacity(0.5), // خلفية شفافة تغطي الشاشة

      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.only(top: 600),
          height: 300,
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),

              // ignore: text_direction_code_point_in_literal
              const Text(
                'Are you sure you want to log out?',

                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 16,
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffC7F688),
                      fixedSize: Size(166, 37),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Color(0xff319710), fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff319710),
                      fixedSize: Size(166, 37),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                      // 🔹 هنا ضع كود تسجيل الخروج الفعلي مثلاً:
                      // Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF319710),
      // --- اضافة القائمة الجانبية ---
      drawer: Drawer(
        backgroundColor: Colors.white,
        /* width: MediaQuery.of(context).size.width * 0.75, */
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.only(top: 24, bottom: 14, left: 5, right: 5),
              decoration: const BoxDecoration(
                color: Color(0xFF319610),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            CupertinoIcons.back,
                            size: 30,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),

                        //const Icon(Icons.person, size: 40, color: Color(0xFFFFFFFF)),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            'assets/images/onboarding/profile.png',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hamdi Jowad',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Hamdi2000@gmail.com',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyReservationsPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      SizedBox(width: 15),
                      Icon(
                        Icons.calendar_month,
                        size: 25,
                        color: Color(0xFF173913),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'My Reservations',
                        style: TextStyle(
                          color: Color(0xFF173913),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );
                  },
                  child: Row(
                    children: const [
                      SizedBox(width: 15),
                      Icon(Icons.person, size: 25, color: Color(0xFF173913)),
                      SizedBox(width: 15),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: Color(0xFF173913),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavoritesPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      SizedBox(width: 15),
                      Icon(
                        Icons.favorite_outline,
                        size: 25,
                        color: Color(0xFF173913),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Favorites',
                        style: TextStyle(
                          color: Color(0xFF173913),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      SizedBox(width: 15),
                      Icon(
                        Icons.notifications_outlined,
                        size: 25,
                        color: Color(0xFF173913),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Notifications',
                        style: TextStyle(
                          color: Color(0xFF173913),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentHistoryPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      SizedBox(width: 15),
                      Icon(Icons.wallet, size: 25, color: Color(0xFF173913)),
                      SizedBox(width: 15),
                      Text(
                        'Payment History',
                        style: TextStyle(
                          color: Color(0xFF173913),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutProgram(),
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      SizedBox(width: 15),
                      Icon(
                        Icons.info_outline,
                        size: 25,
                        color: Color(0xFF173913),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'About program',
                        style: TextStyle(
                          color: Color(0xFF173913),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 350),

                InkWell(
                  onTap: () =>
                      _showLogoutDialog(context), // عند الضغط على "Logout"
                  child: Row(
                    children: const [
                      SizedBox(width: 15),
                      Icon(
                        Icons.logout_outlined,
                        size: 25,
                        color: Color(0xFF173913),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Logout',
                        style: TextStyle(
                          color: Color(0xFF173913),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // --- شريط البحث العلوي ---
            Padding(
              padding: const EdgeInsets.fromLTRB(19, 10, 18, 10),
              child: Row(
                children: [
                  Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.settings_input_component_rounded,
                            color: Color(0xFF319610),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                        color: Color(0xFF319610),
                        fontSize: 18,

                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          color: Color(0xFF319610),
                          fontSize: 18,

                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFF319610),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18.0,
                        ),
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
            const SizedBox(height: 7),

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
                              location: stadium['location'],
                              capacity: stadium['capacity'],
                              startDate: stadium['startDate'],
                              endDate: stadium['endDate'],
                            ),
                          ),
                        );
                      },
                      child: StadiumCard(
                        //استدعاء بطاقة الملعب
                        name: stadium['name']!,
                        price: stadium['price']!,
                        imageUrl: stadium['image']!,
                        isFavorite: stadium['isFavorite'],
                        onFavoritePressed: () {
                          setState(() {
                            stadium['isFavorite'] = !stadium['isFavorite'];
                          });
                        },
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
