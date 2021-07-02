import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning2/sl.dart';
import 'package:learning2/views/home.dart';

void main() async {
  await setUpServiceLocator();
  runApp(CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Break',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.nunitoTextTheme()
      ),
      home: Home(),
    );
  }
}

