import 'package:flutter/material.dart';
import 'package:ui_trip/widgets/history.dart';
import 'package:ui_trip/widgets/ticket.dart';
import 'package:ui_trip/widgets/uncompleted.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Uncompleted(),
    Ticket(),
    History(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Ticket orders',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // top navigation bar
          Container(
            color: Colors.white24,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem("Uncompleted", 0),
                _buildDiver(),
                _buildNavItem("Ticket", 1),
                _buildDiver(),
                _buildNavItem("History", 2),
              ],
            ),
          ),
          // Content based on selected tab
          Expanded(
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
              fontSize: 16,
            ),
          ),
          if (_selectedIndex == index)
            Container(
              margin: const EdgeInsets.only(top: 3),
              height: 2,
              width: 20,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }

  Widget _buildDiver() {
    return const Text(
      '|',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 18,
      ),
    );
  }
}
