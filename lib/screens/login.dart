import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_trip/screens/registration.dart';

import '../service/auth_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/show_dialogs.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  void _login(BuildContext context) async {
    try {
      User? user = await _authService.login(
          email: _emailController.text, password: _passwordController.text);

      if (user != null) {
        Navigator.pushReplacementNamed(context, '/main');
      }
    } catch (ex) {
      showErrorDialog(context, ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Image background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 280, // Adjust the height as needed
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/train1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Container(
              height: 430, // Adjust height as needed
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Divider(
                      thickness: 3,
                      indent: 150,
                      endIndent: 150,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 50),

                    // constructe the fields
                    CustomTextField(
                      label: 'Email address',
                      hint: 'Enter your email',
                      controller: _emailController,
                      isKeyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    CustomTextField(
                      label: 'Password',
                      hint: 'Enter your password',
                      controller: _passwordController,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // registration button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _login(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 160,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: const Text(
                        'Sign-In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account ?',
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Registration()));
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
