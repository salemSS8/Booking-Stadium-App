import 'package:flutter/material.dart';

class DateTimeInputExample extends StatefulWidget {
  const DateTimeInputExample({super.key});

  @override
  State<DateTimeInputExample> createState() => _DateTimeInputExampleState();
}

class _DateTimeInputExampleState extends State<DateTimeInputExample> {
  DateTime? _selectedDate;
  int? _selectedDuration; // عدد الساعات
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  // السعر والعمولة
  double _price = 0;
  double _commission = 0;

  // متغير لتخزين طريقة الدفع المختارة
  String? _selectedPayment;

  bool _agreeToTerms = false;
  // قائمة خيارات الدفع
  final List<String> paymentMethods = ['Electronic Card', 'Bank Deposit'];

  // تحديث السعر والعمولة بناءً على عدد الساعات
  void _updatePriceAndCommission() {
    if (_selectedDuration != null) {
      _price = _selectedDuration! * 2000; // سعر الساعة 2000
      _commission = _price * 0.1; // عمولة 10%
    } else {
      _price = 0;
      _commission = 0;
    }
    setState(() {});
  }

  // دالة لتنسيق التاريخ
  String formatDate(DateTime d) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${d.day} ${months[d.month - 1]} ${d.year}';
  }

  // دالة لتنسيق الوقت
  String formatTime(TimeOfDay t) {
    final hour = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    final period = t.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:${t.minute.toString().padLeft(2, '0')} $period';
  }

  // اختيار التاريخ
  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(now.year + 2),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFF319710)),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // اختيار المدة
  Future<void> _pickDuration() async {
    final List<int> hours = [1, 2, 3, 4, 5, 6];
    final picked = await showModalBottomSheet<int>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Select Duration (Hours)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ...hours.map(
            (h) => ListTile(
              title: Text('$h hour${h > 1 ? 's' : ''}'),
              onTap: () => Navigator.pop(context, h),
            ),
          ),
        ],
      ),
    );
    if (picked != null) {
      setState(() {
        _selectedDuration = picked;
        _updatePriceAndCommission(); // تحديث السعر والعمولة تلقائياً

        // ضبط وقت النهاية تلقائيًا إذا تم تحديد وقت البداية مسبقًا
        if (_startTime != null) {
          final endMinutes =
              (_startTime!.hour * 60 + _startTime!.minute) +
              (_selectedDuration! * 60);
          final endHour = endMinutes ~/ 60;
          final endMinute = endMinutes % 60;
          _endTime = TimeOfDay(hour: endHour % 24, minute: endMinute);
        }
      });
    }
  }

  // اختيار الوقت مع ضبط وقت النهاية تلقائيًا
  Future<void> _pickTime({required bool isStart}) async {
    final now = TimeOfDay.now();
    final picked = await showTimePicker(
      context: context,
      initialTime: isStart ? (_startTime ?? now) : (_endTime ?? now),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTime = picked;

          // ضبط وقت النهاية تلقائيًا إذا كانت المدة محددة
          if (_selectedDuration != null) {
            final endMinutes =
                (_startTime!.hour * 60 + _startTime!.minute) +
                (_selectedDuration! * 60);
            final endHour = endMinutes ~/ 60;
            final endMinute = endMinutes % 60;
            _endTime = TimeOfDay(hour: endHour % 24, minute: endMinute);
          }
        } else {
          if (_selectedDuration != null && _startTime != null) {
            // ضبط الوقت تلقائيًا ليطابق المدة
            final startMinutes = _startTime!.hour * 60 + _startTime!.minute;
            final expectedEndMinutes = startMinutes + _selectedDuration! * 60;
            final pickedMinutes = picked.hour * 60 + picked.minute;
            if (pickedMinutes != expectedEndMinutes) {
              final endHour = expectedEndMinutes ~/ 60;
              final endMinute = expectedEndMinutes % 60;
              _endTime = TimeOfDay(hour: endHour % 24, minute: endMinute);
            } else {
              _endTime = picked;
            }
          } else {
            _endTime = picked;
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF319710),
      appBar: AppBar(
        backgroundColor: const Color(0xFF319710),
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              "Al-Amoudi Stadium",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              "Booking details",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), // الحافة العليا اليسرى
            topRight: Radius.circular(30), // الحافة العليا اليمنى
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              // فورم التاريخ
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Date:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D5E08),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: _pickDate,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white, // لون خلفية الفورم
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(
                          0xFF319710,
                        ).withOpacity(1), // ظل أخضر شبه شفاف
                        blurRadius: 9, // درجة الضبابية
                        offset: const Offset(0, 1), // اتجاه الظل للأسفل
                      ),
                    ],
                  ),

                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // نجعل العناصر تبدأ من اليسار
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Color(0xFF319710),
                      ), // الأيقونة أولاً
                      const SizedBox(
                        width: 8,
                      ), // مسافة بسيطة بين الأيقونة والنص
                      Text(
                        _selectedDate == null
                            ? 'Select date'
                            : formatDate(_selectedDate!),
                        style: TextStyle(
                          fontSize: 16,
                          color: _selectedDate == null
                              ? const Color(0xFF1D5E08)
                              : Color.fromARGB(255, 30, 94, 9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // فورم المدة
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Duration:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D5E08),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: _pickDuration,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white, // لون خلفية الفورم
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(
                          0xFF319710,
                        ).withOpacity(1), // ظل أخضر شبه شفاف
                        blurRadius: 9, // درجة الضبابية
                        offset: const Offset(0, 1), // اتجاه الظل للأسفل
                      ),
                    ],
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.access_time, color: Color(0xFF319710)),
                      const SizedBox(
                        width: 8,
                      ), // مسافة بسيطة بين الأيقونة والنص
                      Text(
                        _selectedDuration == null
                            ? 'Select duration'
                            : '$_selectedDuration hour${_selectedDuration! > 1 ? 's' : ''}',
                        style: TextStyle(
                          fontSize: 16,
                          color: _selectedDuration == null
                              ? Color(0xFF1D5E08)
                              : Color.fromARGB(255, 30, 94, 9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // فورم وقت البداية
              InkWell(
                onTap: () => _pickTime(isStart: true),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF319710),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _startTime == null
                        ? 'From --:--'
                        : 'From ${formatTime(_startTime!)}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 7),

              // فورم وقت النهاية
              InkWell(
                onTap: () => _pickTime(isStart: false),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF319710),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _endTime == null
                        ? 'Until --:--'
                        : 'Until ${formatTime(_endTime!)}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 3),

              // فورم السعر
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Price:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D5E08),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white, // لون خلفية الفورم
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                        0xFF319710,
                      ).withOpacity(1), // ظل أخضر شبه شفاف
                      blurRadius: 9, // درجة الضبابية
                      offset: const Offset(0, 1), // اتجاه الظل للأسفل
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    const Icon(Icons.attach_money, color: Color(0xFF319710)),
                    const SizedBox(width: 8), // مسافة بسيطة بين الأيقونة والنص
                    Text('${_price.toStringAsFixed(0)} YER / Hour', style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 30, 94, 9),
                      ),),
                    
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // فورم العمولة
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Commission:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D5E08),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white, // خلفية الفورم
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                        0xFF319710,
                      ).withOpacity(1), // ظل أخضر غامق
                      blurRadius: 9, // مدى انتشار الظل
                      offset: const Offset(0, 1), // اتجاه الظل للأسفل قليلاً
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.monetization_on, color: Color(0xFF319710)),
                    const SizedBox(width: 8), // مسافة بسيطة بين الأيقونة والنص
                    Text(
                      '${_commission.toStringAsFixed(0)} YER',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 30, 94, 9),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // فورم اختيار طريقة الدفع
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Payment Method:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D5E08),
                  ),
                ),
              ),
              SizedBox(height: 8),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                        0xFF319710,
                      ).withOpacity(1), // ظل أخضر غامق
                      blurRadius: 9, // مدى انتشار الظل
                      offset: const Offset(0, 1), // اتجاه الظل للأسفل قليلاً
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Radio<String>(
                            value: 'Bank Transfer',
                            groupValue: _selectedPayment,
                            activeColor: const Color(0xFF319710),
                            onChanged: (value) {
                              setState(() {
                                _selectedPayment = value!;
                              });
                            },
                          ),
                          const Text(
                            'Bank Transfer',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF1D5E08),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio<String>(
                            value: 'Credit Card',
                            groupValue: _selectedPayment,
                            activeColor: const Color(0xFF319710),
                            onChanged: (value) {
                              setState(() {
                                _selectedPayment = value!;
                              });
                            },
                          ),
                          const Text(
                            'Credit Card',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF1D5E08),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 0),

              // نص الموافقة على الشروط ومربع الموافقة
              Row(
                children: [
                  Transform.scale(
                    scale:
                        1.2, //   (1.0 = الحجم العادي، 1.5 = أكبر) تغيير حجم المربع
                    child: Checkbox(
                      value: _agreeToTerms,
                      activeColor: const Color(0xFF319710), // اللون الأخضر
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), //  خفيف التقوّس
                      ),
                      onChanged: (value) {
                        setState(() {
                          _agreeToTerms = value ?? false;
                        });
                      },
                    ),
                  ),
                  //const SizedBox(width: 1),
                  const Text(
                    'I agree to the terms and conditions.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF1D5E08),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              // زر تأكيد الحجز
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF319710),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  onPressed:
                      (_selectedDate != null &&
                          _selectedDuration != null &&
                          _startTime != null &&
                          _endTime != null &&
                          _selectedPayment != null &&
                          _agreeToTerms)
                      ? () {
                          // هنا يتم تنفيذ عملية التأكيد بعد تحقق جميع الشروط
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Booking Confirmed Successfully ✅'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      : null, // إذا لم تتحقق الشروط يبقى الزر معطلاً
                  child: const Text(
                    'Confirm Booking',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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