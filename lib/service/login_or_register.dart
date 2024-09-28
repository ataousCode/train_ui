import 'package:flutter/material.dart';
import 'package:ui_trip/screens/login.dart';
import 'package:ui_trip/screens/registration.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showAuthPage = true;

  void togglePages() {
    setState(() {
      showAuthPage = !showAuthPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showAuthPage) {
      return const Login();
    } else {
      return Registration();
    }
  }
}
