import 'package:flutter/material.dart';
import 'package:ui_trip/widgets/styled_button.dart';

import '../theme.dart';

class ResetEmail extends StatefulWidget {
  const ResetEmail({super.key});

  @override
  State<ResetEmail> createState() => _ResetEmailState();
}

class _ResetEmailState extends State<ResetEmail> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change associated email'),
        centerTitle: true,
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _emailController,
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  label: Text('please enter your email'),
                ),
              ),
              const SizedBox(height: 15),
              // password field goes here...
              TextField(
                controller: _passwordController,
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  label: Text('please enter your password'),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'This email address is associated with your 12306 account. You can use it to login and modify your account information.',
              ),
              const SizedBox(height: 30),
              //const SizedBox(height: 30),
              StyledButton(onPressed: () {}, child: 'Confirm'),
            ],
          ),
        ),
      ),
    );
  }
}
