class SharedReservations {
  // Singleton
  static final SharedReservations _instance = SharedReservations._internal();
  factory SharedReservations() => _instance;
  SharedReservations._internal();

  // قائمة الحجوزات
  List<Map<String, String>> reservations = [];
}
