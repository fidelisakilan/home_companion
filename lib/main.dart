import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_companion/screens/home.dart';
import 'package:home_companion/screens/loginScreen.dart';

import 'screens/detailsPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xff232F4D),
      statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.lightBlue[100],
        primaryColor: Color(0xff232F4D),
        fontFamily: 'exo',
      ),
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => SignIn(),
        '/details': (context) => DetailsPage(),
      },
    );
  }
}
