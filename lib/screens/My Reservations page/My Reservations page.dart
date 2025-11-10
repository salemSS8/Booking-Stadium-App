import 'package:flutter/material.dart';


class MyReservationsPage extends StatelessWidget {
  const MyReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF319710);

    final reservations = [
      {
        'image': 'images/football-stadium_1.jpg',
        'name': 'Al-Manasa',
        'price': '\$130',
        'date': '12 October 2025',
        'time': '7:00 - 9:00 PM',
      },
      {
        'image': 'images/football-stadium_2.jpg',
        'name': 'Al-Amoudi',
        'price': '\$200',
        'date': '26 September 2025',
        'time': '4:00 - 6:00 PM',
      },
      {
        'image': 'images/football-stadium_3.jpg',
        'name': 'Al-Manasa',
        'price': '\$150',
        'date': '05 November 2025',
        'time': '6:00 - 8:00 PM',
      },
    ];

    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        backgroundColor: green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Reservations',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: reservations.length,
          separatorBuilder: (_, __) => const SizedBox(height: 25),
          itemBuilder: (context, i) => ReservationCard(data: reservations[i]),
        ),
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  final Map<String, String> data;
  const ReservationCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF319710);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: green.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              data['image']!,
              width: 90,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['name']!,
                  style: const TextStyle(
                    color: green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data['date']!,
                  style: const TextStyle(color: green, fontSize: 13),
                ),
                Text(
                  data['time']!,
                  style: const TextStyle(color: green, fontSize: 13),
                ),
              ],
            ),
          ),
          Text(
            data['price']!,
            style: const TextStyle(
              color: green,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
