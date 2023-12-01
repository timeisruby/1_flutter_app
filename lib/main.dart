import 'package:bussiness_card/screen/main_screen.dart';
import 'package:bussiness_card/screen/splash_screen.dart';
import 'package:flutter/material.dart';

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
      title: 'Name_Card',
      initialRoute: '/',
      routes: {
        '/':(context) => SplashScreen(),
        '/main':(context)=> MainScreen(),
      },
    );
  }
}
