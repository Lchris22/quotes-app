import 'package:flutter/material.dart';
import 'package:flutter_quotes_app/screens/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
      // theme: _buildTheme(Brightness.light),
      theme: ThemeData(
        fontFamily: 'PTSerif',
      ),
    );
  }
}
