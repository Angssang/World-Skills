import 'package:drive_mate/ui/splash.dart';
import 'package:drive_mate/ui/view/login/login_view.dart';
import 'package:drive_mate/ui/view/register/register_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
