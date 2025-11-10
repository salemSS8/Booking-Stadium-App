import 'package:flutter/material.dart';

class AboutProgram extends StatelessWidget {
  const AboutProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff319710),
      appBar: AppBar(
        backgroundColor: Color(0xff319710),
        title: Text(
          'About Program',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Color(0xffffffff)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/bool2.jpg',
                          ),
                          radius: 70,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Version 1.0.1 \n 1.09.2025',
                          style: TextStyle(
                            color: Color(0xff319710),
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 350,
                          height: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            image: DecorationImage(
                              image: AssetImage('assets/images/bool.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Conditions of service use',
                          style: TextStyle(
                            color: Color(0xff319710),
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15),
                        Center(
                          child: SizedBox(
                            width: 312,
                            child: Divider(
                              color: Color(0xff319710),
                              thickness: 1,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Privacy policy',
                          style: TextStyle(
                            color: Color(0xff319710),
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.telegram_rounded,
                                  size: 50,
                                  color: Color(0xff319710),
                                ),
                                SizedBox(width: 20),
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff319710),
                                      shape: BoxShape.circle,
                                    ),

                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.share,
                                          color: Color(0xffffffff),
                                          size: 22,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Center(
                          child: Text(
                            'Rate us in the App Store',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff319710),
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: 312,
                            height: 25,
                            child: Divider(
                              color: Color(0xff319710),
                              thickness: 1,
                              height: 0,
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            child: Text(
                              'www.ArenaBook.uz',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff319710),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
