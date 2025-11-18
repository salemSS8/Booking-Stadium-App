import 'package:flutter/material.dart';
import 'package:ArenaBook/screens/about_Program/about_program.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff319710),

      appBar: AppBar(
        backgroundColor: Color(0xff319710),
        title: (Text(
          'Privacy Policy',

          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        )),

        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xffffffff)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 7.0), // مسافة من بعد الـ AppBar
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 350,
                              height: 230,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/privacyco/privacy.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Information We Collect',
                            style: TextStyle(
                              color: Color(0xff095900),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '. Basic account info (name, phone, email).',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,

                              color: Color(0xff095900),
                            ),
                          ),
                          Text(
                            '. Booking details and payment info.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,

                              color: Color(0xff095900),
                            ),
                          ),
                          Text(
                            'How We Use It',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff095900),
                            ),
                          ),
                          Text(
                            '. To confirm your bookings.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,

                              color: Color(0xff095900),
                            ),
                          ),
                          Text(
                            '. To confirm your bookings.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,

                              color: Color(0xff095900),
                            ),
                          ),
                          Text(
                            '. To confirm your bookings.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,

                              color: Color(0xff095900),
                            ),
                          ),
                          Text(
                            'Sharing',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff095900),
                            ),
                          ),
                          Text(
                            '. We don’t sell your data.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff095900),
                            ),
                          ),
                          Text(
                            '. Data may be shared only with stadium \n owners or payment providers.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff095900),
                            ),
                          ),
                          Text(
                            'Security',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff095900),
                            ),
                          ),
                          Text(
                            '. We protect your data with safe systems.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff095900),
                            ),
                          ),
                          Text(
                            '. But we cannot guarantee 100% security.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff095900),
                            ),
                          ),
                          Text(
                            'Your Rights',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff095900),
                            ),
                          ),
                          Text(
                            '. You can update or delete your info anytime.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff095900),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: SizedBox(
                          width: 200,
                          height: 55,

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff319710),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              padding: const EdgeInsets.all(16),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                // context,
                                MaterialPageRoute(
                                  builder: (context) => AboutProgram(),
                                ),
                              );
                            },
                            child: const Text(
                              "Done",
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
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
