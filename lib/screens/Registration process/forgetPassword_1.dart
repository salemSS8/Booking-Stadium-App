import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 402,
      height: 874,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFF319710),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Stack(
        children: [
          // Email Input Section
          Positioned(
            left: 49,
            top: 262,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 295,
                  child: Text(
                    'Enter E-mail ID',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: 297,
                  height: 54,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 15,
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        color: Color(0x84DDD5D5),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 10),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your email',
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Continue Button
          Positioned(
            left: 39,
            top: 408,
            child: Container(
              width: 317,
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                height: 54,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Color(0xFF319710),
                      fontSize: 16,
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Header Bar
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 402,
              height: 79,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),

          // Back Button (placeholder)
          Positioned(
            left: 6,
            top: 22,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}
