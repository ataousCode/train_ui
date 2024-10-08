import 'package:flutter/material.dart';
import 'package:ui_trip/screens/passenger_information_screen.dart';
import 'package:ui_trip/screens/settings_screen.dart';
import 'package:ui_trip/screens/version_screen.dart';
import 'package:ui_trip/widgets/change_password_textfield.dart';
import 'package:ui_trip/widgets/profile_app_bar.dart';
import 'package:ui_trip/widgets/reset_email.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service/auth_service.dart';
import '../widgets/show_dialogs.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final AuthService _authService = AuthService();

  // this a single method to logout
  void _logout(BuildContext context) async {
    bool shouldLogout = await showLogoutConfirmation(context);
    if (shouldLogout) {
      await _authService.logout();
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  // this method show thr call and cancel btn
  void _showCallBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Call +8613027207507'),
              onTap: () {
                Navigator.pop(context); // Close the bottom sheet
                _makePhoneCall('+8613027207507');
              },
            ),
            ListTile(
              leading: Icon(Icons.cancel),
              title: Text('Cancel'),
              onTap: () {
                Navigator.pop(context); // Close the bottom sheet
              },
            ),
          ],
        );
      },
    );
  }

  // this is the method to call a number
  void _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            // Custom app bar
            const ProfileAppBar(),
            //Body section
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetEmail(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.email),
                      title: Text('My email'),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const PassengerInformationScreen(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.people),
                      title: Text('Passenger'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangePasswordTextfield(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.lock),
                      title: Text('Change password'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  const Divider(),
                  //ShowCallBottomSheet(),
                  GestureDetector(
                    onTap: () {
                      _showCallBottomSheet(context);
                    },
                    child: const ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Mobile number'),
                      subtitle: Text('24/7'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                    child: const ListTile(
                      title: Text('Settings'),
                      leading: Icon(Icons.settings),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VersionScreen(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.info),
                      title: Text('Version'),
                      trailing: Text('5.8.2.31'),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: GestureDetector(
                      onTap: () => _logout(context),
                      child: const Text('LogOut'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
