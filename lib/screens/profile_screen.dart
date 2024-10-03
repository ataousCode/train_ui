import 'package:flutter/material.dart';
import 'package:ui_trip/screens/passenger_information_screen.dart';
import 'package:ui_trip/widgets/profile_app_bar.dart';
import 'package:ui_trip/widgets/reset_email.dart';

import '../service/auth_service.dart';
import '../widgets/show_dialogs.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final AuthService _authService = AuthService();

  void _logout(BuildContext context) async {
    bool shouldLogout = await showLogoutConfirmation(context);
    if (shouldLogout) {
      await _authService.logout();
      Navigator.pushReplacementNamed(context, '/login');
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
                  const ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('Change password'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Mobile number'),
                    subtitle: Text('24/7'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Icon(Icons.info),
                    title: Text('Version'),
                    trailing: Text('5.8.2.31'),
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

// body: Expanded(
//         child: ListView(
//           padding: const EdgeInsets.all(8),
//           children: const [
//             ListTile(
//               leading: Icon(Icons.email),
//               title: Text('My email'),
//               trailing: Icon(Icons.chevron_right),
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.people),
//               title: Text('Passenger'),
//               trailing: Icon(Icons.chevron_right),
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.lock),
//               title: Text('Change password'),
//               trailing: Icon(Icons.chevron_right),
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.phone),
//               title: Text('Mobile number'),
//               subtitle: Text('24/7'),
//               trailing: Icon(Icons.chevron_right),
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.info),
//               title: Text('Version'),
//               trailing: Text('5.8.2.31'),
//             ),
//           ],
//         ),
//       ),
