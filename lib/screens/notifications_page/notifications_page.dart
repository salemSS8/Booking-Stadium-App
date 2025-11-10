import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'title': 'Al-Amoudi Stadium',
        'phone': '+967 772546627',
        'message':
            'Your reservation has been confirmed that they are coming to play from 8:00 - 10:00',
        'time': '9:00 am today',
      },
      {
        'title': 'Al-Bander Stadium',
        'phone': '+967 733601188',
        'message':
            'Your reservation has been confirmed that they are coming to play from 4:00 - 6:00',
        'time': '5:00 am yesterday',
      },
      {
        'title': 'Al-Shafei Stadium',
        'phone': '+967 774672241',
        'message':
            'Your reservation has been confirmed that they are coming to play from 6:00 - 7:00',
        'time': '10:00 am last week',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF319710),
      appBar: AppBar(
        backgroundColor: const Color(0xFF319710),
        elevation: 0,
        leading: IconButton(onPressed:()
        {
          Navigator.pop(context);
        } , icon:Icon(Icons.arrow_back_ios, color: Colors.white)),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final item = notifications[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.7),
                    blurRadius: 8,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item['title']!,
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        item['time']!,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${item['phone']} ${item['message']}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      height: 1.3,
                    ),
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
