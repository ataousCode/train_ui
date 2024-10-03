import 'package:flutter/material.dart';

class ChangePasswordTextfield extends StatelessWidget {
  const ChangePasswordTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change password'),
        centerTitle: true,
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Old password field
              _buildPasswordField("Old password"),
              SizedBox(height: 16),
              // New password field
              _buildPasswordField("New password"),
              SizedBox(height: 16),
              // Confirm new password field
              _buildPasswordField("Enter the new password again"),
              SizedBox(height: 32),
              // Confirm button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle confirm action
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.blue, // Button color
                  ),
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      fontSize: 16,
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

  // Helper method to build a password text field
  Widget _buildPasswordField(String hintText) {
    return TextField(
      obscureText: true, // Hide the password input
      decoration: InputDecoration(
        hintText: hintText,
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8),
        // ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
