import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    required this.date,
    required this.time,
    required this.from,
    required this.to,
    required this.details,
  });

  final String date;
  final String time;
  final String from;
  final String to;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.circle,
                  size: 12,
                  color: Colors.blue,
                ),
                const SizedBox(height: 8),
                Text(
                  '$time $from -> $to',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              details,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
