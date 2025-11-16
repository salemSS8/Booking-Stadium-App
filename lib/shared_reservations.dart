class SharedReservations {
  // Singleton
  static final SharedReservations _instance = SharedReservations._internal();
  factory SharedReservations() => _instance;
  SharedReservations._internal();

  // قائمة الحجوزات
  List<Map<String, String>> reservations = [];
}

// onPressed: () {
//   SharedReservations().reservations.add({
//     'image': 'images/football-stadium_1.jpg',
//     'name': 'Al-Amoudi Stadium',
//     'price': '${_price.toStringAsFixed(0)} YER',
//     'date': formatDate(_selectedDate!),
//     'time': '${formatTime(_startTime!)} - ${formatTime(_endTime!)}',
//   });

//   ScaffoldMessenger.of(context).showSnackBar(
//     const SnackBar(
//       content: Text('Booking Saved Successfully ✅'),
//       backgroundColor: Colors.green,
//     ),
//   );
// },
