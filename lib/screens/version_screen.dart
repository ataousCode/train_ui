import 'package:flutter/material.dart';

class VersionScreen extends StatelessWidget {
  const VersionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Version'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Column(
              children: const [
                // Image.asset(
                //   'assets/train1.jpg',
                //   width: 80,
                //   height: 80,
                // ),
                FlutterLogo(size: 55),
                SizedBox(height: 10),
                Text(
                  'Make your trip easy',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30),
            Divider(),
            // version details
            _buildInfoRow('Version', '5.8.3'),
            Divider(),
            _buildInfoRow('Customer service number', '12345'),
            Divider(),
            _buildInfoRow('Facebook official account', 'CRT12345'),
            Spacer(),
            // bottom links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Terms of Service'),
                ),
                SizedBox(width: 16),
                TextButton(
                  onPressed: () {},
                  child: Text('Privacy Policy'),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Copy right
            Text(
              'Copyright © 2008-2023 China Academy of Railway Sciences Corporation Limited. All rights reserved',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 22),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          Text(value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
