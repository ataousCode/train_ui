import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'English'; // Initial language is English

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: const BackButton(),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          _buildSettingsOption(
            title: 'Language',
            value: _selectedLanguage,
            onTap: () {
              _showLanguageSelectionSheet(context);
            },
          ),
          const SizedBox(height: 16),
          _buildSettingsOption(
            title: 'Face ID login',
            value: 'Disabled',
            onTap: () {
              // Handle Face ID login settings
            },
          ),
          const Spacer(),
          _buildLogoutButton(context),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  // this is method to build each settings option with a styled container
  Widget _buildSettingsOption({
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            Text(value, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  // Method to show the bottom sheet for language selection
  void _showLanguageSelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Choose Language',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('English'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'English';
                  });
                  Navigator.of(context).pop(); // Close bottom sheet
                },
                trailing: _selectedLanguage == 'English'
                    ? const Icon(Icons.check, color: Colors.blue)
                    : null,
              ),
              ListTile(
                title: const Text('French'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'French';
                  });
                  Navigator.of(context).pop(); // Close bottom sheet
                },
                trailing: _selectedLanguage == 'French'
                    ? const Icon(Icons.check, color: Colors.blue)
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }

  // Method to build the logout button
  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle logout logic here
          _showLogoutConfirmationDialog(context);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          side: const BorderSide(color: Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text('Log out', style: TextStyle(fontSize: 16)),
      ),
    );
  }

  // Method to show a confirmation dialog on logout
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Log out"),
          content: const Text("Are you sure you want to log out?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Perform logout operation
                Navigator.of(context).pop();
              },
              child: const Text("Log out"),
            ),
          ],
        );
      },
    );
  }
}
