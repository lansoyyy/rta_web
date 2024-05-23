import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rta_web/screens/auth/login_screen.dart';
import 'package:rta_web/screens/cashier_home_screen.dart';
import 'package:rta_web/screens/home_screen.dart';
import 'package:rta_web/screens/tabs/add_account_screen.dart';
import 'package:rta_web/screens/tabs/alltickets_tab.dart';
import 'package:rta_web/screens/tabs/enforcers_tab.dart';
import 'package:rta_web/screens/tabs/my_profile_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDkJByZydja4BEzJ_KKMnR4sUtGqkwuwM8",
          authDomain: "thesis-rta.firebaseapp.com",
          projectId: "thesis-rta",
          storageBucket: "thesis-rta.appspot.com",
          messagingSenderId: "635736180770",
          appId: "1:635736180770:web:9e8edf266d459b22cd227b"));
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
