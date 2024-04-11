import 'package:flutter/material.dart';
import 'package:rta_web/screens/auth/login_screen.dart';
import 'package:rta_web/screens/home_screen.dart';
import 'package:rta_web/screens/tabs/add_account_screen.dart';
import 'package:rta_web/screens/tabs/alltickets_tab.dart';
import 'package:rta_web/screens/tabs/enforcers_tab.dart';
import 'package:rta_web/screens/tabs/my_profile_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}
