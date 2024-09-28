import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_trip/screens/login.dart';
import 'package:ui_trip/service/auth_service.dart';
import 'package:ui_trip/widgets/custom_text_field.dart';
import 'package:ui_trip/widgets/show_dialogs.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  void _register(BuildContext context) async {
    try {
      User? user = await _authService.register(
        email: _emailController.text,
        password: _passwordController.text,
        firstname: _firstNameController.text,
        lastname: _lastNameController.text,
      );

      if (user != null) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    } catch (ex) {
      showErrorDialog(context, ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250, // Adjust the height as needed
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/train1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 700, // Adjust height as needed
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
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Divider(
                      thickness: 3,
                      indent: 150,
                      endIndent: 150,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 20),

                    // constructe the fields
                    CustomTextField(
                      label: 'First name',
                      hint: 'Enter your firstname',
                      controller: _firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Firstname is required";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),
                    CustomTextField(
                      label: 'Last name',
                      hint: 'Enter your lastname',
                      controller: _lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Lastname is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
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
                          _register(context);
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
                        'Sign-Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    //! makes a divider
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                            endIndent: 10,
                          ),
                        ),
                        Text('Or continue with'),
                        SizedBox(width: 10),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                            endIndent: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/google_icon.png',
                            width: 20,
                          ),
                          label: const Text('Google'),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.black),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 50),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/apple_icon.png',
                            width: 20,
                          ),
                          label: const Text('Apple'),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.black),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Have an account ?',
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: const Text(
                            'Sign In',
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
