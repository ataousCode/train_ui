import 'package:flutter/material.dart';
import 'package:ui_trip/screens/ticket_card.dart';

class TicketOrderScreen extends StatelessWidget {
  TicketOrderScreen({super.key});

  final List<Map<String, String>> tickets = [
    {
      'date': '2024-09-16',
      'time': '09:11',
      'from': 'Zigong(自贡)',
      'to': 'Mianyang(绵阳)',
      'details': 'G1574 | Tue, Sept 17 | 2h1m'
    },
    {
      'date': '2024-09-12',
      'time': '08:13',
      'from': 'Mianyang(绵阳)',
      'to': 'Zigong(自贡)',
      'details': 'G8791 | Fri, Sept 13 | 2h6m'
    },
    {
      'date': '2024-09-16',
      'time': '09:11',
      'from': 'Zigong(自贡)',
      'to': 'Mianyang(绵阳)',
      'details': 'G1574 | Tue, Sept 17 | 2h1m'
    },
    {
      'date': '2024-09-12',
      'time': '08:13',
      'from': 'Mianyang(绵阳)',
      'to': 'Zigong(自贡)',
      'details': 'G8791 | Fri, Sept 13 | 2h6m'
    },
    {
      'date': '2024-09-16',
      'time': '09:11',
      'from': 'Zigong(自贡)',
      'to': 'Mianyang(绵阳)',
      'details': 'G1574 | Tue, Sept 17 | 2h1m'
    },
    {
      'date': '2024-09-12',
      'time': '08:13',
      'from': 'Mianyang(绵阳)',
      'to': 'Zigong(自贡)',
      'details': 'G8791 | Fri, Sept 13 | 2h6m'
    },
    {
      'date': '2024-09-16',
      'time': '09:11',
      'from': 'Zigong(自贡)',
      'to': 'Mianyang(绵阳)',
      'details': 'G1574 | Tue, Sept 17 | 2h1m'
    },
    {
      'date': '2024-09-12',
      'time': '08:13',
      'from': 'Mianyang(绵阳)',
      'to': 'Zigong(自贡)',
      'details': 'G8791 | Fri, Sept 13 | 2h6m'
    },
    {
      'date': '2024-09-16',
      'time': '09:11',
      'from': 'Zigong(自贡)',
      'to': 'Mianyang(绵阳)',
      'details': 'G1574 | Tue, Sept 17 | 2h1m'
    },
    {
      'date': '2024-09-12',
      'time': '08:13',
      'from': 'Mianyang(绵阳)',
      'to': 'Zigong(自贡)',
      'details': 'G8791 | Fri, Sept 13 | 2h6m'
    },
    // {
    //   'date': '2024-09-11',
    //   'time': '13:40',
    //   'from': 'Shuangliujichang(双流机场)',
    //   'to': 'Mianyang(绵阳)',
    //   'details': 'C6318 | Thu, Sept 12 | 1h4m'
    // },
    // {
    //   'date': '2024-09-11',
    //   'time': '20:25',
    //   'from': 'Mianyang(绵阳)',
    //   'to': 'Shuangliujichang(双流机场)',
    //   'details': 'D1987 | Wed, Sept 11 | 1h22m'
    // }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: tickets.length,
      itemBuilder: (context, index) {
        return TicketCard(
          date: tickets[index]['date']!,
          time: tickets[index]['time']!,
          from: tickets[index]['from']!,
          to: tickets[index]['to']!,
          details: tickets[index]['details']!,
        );
      },
    );
  }
}
