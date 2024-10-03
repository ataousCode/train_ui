import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrainSearchCard extends StatefulWidget {
  const TrainSearchCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TrainSearchCardState createState() => _TrainSearchCardState();
}

class _TrainSearchCardState extends State<TrainSearchCard> {
  DateTime selectedDate = DateTime.now(); // Default date to current

  // Function to show the DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('From'),
                Text('To'),
              ],
            ),
            // From - To Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLocationField("Mianyang", "绵阳"),
                const Icon(Icons.rotate_right_outlined),
                _buildLocationField("Chengdu", "成都"),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),

            // Date Field with DatePicker
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Date'),
                  Text(
                    DateFormat('EEE, MMM d')
                        .format(selectedDate), // Display the selected date
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            const Divider(),
            // High-speed trains only Checkbox
            Row(
              children: [
                Checkbox(
                    value: false,
                    onChanged: (bool? value) {
                      setState(() {
                        value = true;
                      });
                    }),
                const Text('High-speed trains only'),
              ],
            ),
            const SizedBox(height: 10),
            // Search Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  backgroundColor: const Color.fromARGB(255, 3, 114, 205)),
              child: const Text('Search',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build location fields (From / To)
  Widget _buildLocationField(String city, String cityInChinese) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(city,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(cityInChinese,
            style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
