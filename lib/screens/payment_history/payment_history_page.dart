import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final payments = [
      {
        'title': 'Al-Amoudi Stadium',
        'time': '7:00 - 9:00 PM',
        'date': '15 Sept 2025',
        'amount': '\$20000',
      },
      {
        'title': 'Al-Bander Stadium',
        'time': '10:00 - 11:00 PM',
        'date': '23 Nov 2025',
        'amount': '\$10000',
      },
      {
        'title': 'Al-Shafei Stadium',
        'time': '4:00 - 6:00 PM',
        'date': '4 May 2025',
        'amount': '\$15000',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF319710),
      appBar: AppBar(
        backgroundColor: const Color(0xFF319710),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: const Text(
          'Payment History',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView.builder(
          itemCount: payments.length,
          itemBuilder: (context, index) {
            final item = payments[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.6),
                    blurRadius: 8,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        item['amount']!,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(item['time']!, style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 3),
                  Text(
                    item['date']!,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
