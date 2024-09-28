import 'package:flutter/material.dart';
import '../model/faq_model.dart';
import '../widgets/app_bar_with_background.dart';
import '../widgets/train_search_card.dart';
import '../widgets/faq_item.dart';

class TrainBookingScreen extends StatelessWidget {
  const TrainBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: AppBarWithBackground(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TrainSearchCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.book_rounded),
                          Text(
                            'FAQ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 238, 238, 185),
                        ),
                        onPressed: () {},
                        child: const Text('more >'),
                      ),
                    ],
                  ),
                  ...faqData.map((faq) => FAQItem(faq)), // Updated FAQ section
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Order'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
      //   ],
      // ),
    );
  }
}
