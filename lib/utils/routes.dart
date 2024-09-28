import 'package:flutter/material.dart';
import 'package:ui_trip/screens/login.dart';
import 'package:ui_trip/screens/main_page.dart';
import 'package:ui_trip/screens/registration.dart';

Map<String, WidgetBuilder> routes = {
  '/login': (context) => const Login(),
  '/register': (context) => Registration(),
  '/main': (context) => const MainPage(),
};
