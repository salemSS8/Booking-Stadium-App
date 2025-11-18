import 'package:flutter/material.dart';
import 'package:ArenaBook/screens/main_screen/main_page.dart';
import 'package:ArenaBook/shared_reservations.dart';

class MyReservationsPage extends StatelessWidget {
  const MyReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF319710);
    final reservations = SharedReservations().reservations;

    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          ),
        ),
        title: const Text(
          'My Reservations',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
