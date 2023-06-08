import 'package:flutter/material.dart';
import 'package:sakitgi/pages/sign_up_page.dart';
import 'package:sakitgi/pages/splash_page.dart';
import 'package:sakitgi/pages/sign_in_page.dart';
import 'package:sakitgi/pages/home/main_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/home': (context) => const MainPage(),
      },
    );
  }
}
