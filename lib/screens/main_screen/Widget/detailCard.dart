import 'package:flutter/material.dart';

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