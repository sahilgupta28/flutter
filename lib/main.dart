import 'package:demo/Auth/LoginPage.dart';
import 'package:flutter/material.dart';

import 'Auth/WelcomePage.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sahil Learning Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        'home': (context) => const HomePage(),
        'login': (context) => const LoginPage(),
        'welcome': (context) => const WelcomePage(),
      },
    );
  }
}
