import 'package:flutter/material.dart';

import '../model/faq_model.dart';

class FAQItem extends StatelessWidget {
  final FAQModel faq;
  const FAQItem(this.faq, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 2,
      child: ExpansionTile(
        title: Text(
          faq.question,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.keyboard_arrow_down),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              faq.answer,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
