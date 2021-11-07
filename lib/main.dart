import 'package:flutter/material.dart';
import 'package:nabd_mobile_app/Splash/View/SplashView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NABD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:SplashView() ,
    );
  }
}
