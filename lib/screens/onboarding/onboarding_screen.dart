import 'package:flutter/material.dart';
import '../../models/onboarding_model.dart';
import '../Registration process/login.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView للشاشات التعليمية
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(model: onboardingData[index]);
            },
          ),

          // زر التخطي أو المتابعة
          Positioned(
            bottom: _currentPage == onboardingData.length - 1
                ? 100
                : 50,
            left: 20,
            right: 20,
            child: _currentPage == onboardingData.length - 1
                ? _buildGetStartedButton()
                : _buildNavigationButtons(),
          ),

          // نقاط الترقيم (Indicators)
          Positioned(
            bottom:70,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < onboardingData.length; i++) {
      indicators.add(
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: _currentPage == i ? 20 : 8, // النقطة المفعلة أوسع
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: _currentPage == i
                ? BorderRadius.circular(10) // شكل ممدد للنقطة المفعلة
                : BorderRadius.circular(4), // شكل دائري للنقاط العادية
            color: _currentPage == i
                ? const Color(0xFF319610)
                : const Color(0xFFD9D9D9),
          ),
        ),
      );
    }
    return indicators;
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            _pageController.jumpToPage(onboardingData.length - 1);
          },
          child: const Text(
            'Skip',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
        GestureDetector(
          onTap: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF319610),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(
              children: [
                Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGetStartedButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF319610),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 2,
        ),
        onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
        },
        child: const Text(
          'Get Started',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
