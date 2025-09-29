import 'package:flutter/material.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( // أضف Scaffold
        body: Container(
          width: MediaQuery.of(context).size.width, // استخدم العرض الكامل
          height: MediaQuery.of(context).size.height, // استخدم الارتفاع الكامل
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFFCFEFD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 17,
                top: 247,
                child: Container(
                  width: 368,
                  height: 368,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo/logo.png'), // استخدام AssetImage بدلاً من NetworkImage
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}