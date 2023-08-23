import 'package:flutter/material.dart';
import 'package:to_do_list/Screen/Home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
       splash: Text('Welcome',style: TextStyle(fontSize: 20, color: Colors.black),),
        backgroundColor: Colors.amber.shade300,
        animationDuration: Duration(seconds: 4),

        nextScreen: Home(),
      ),
    );
  }
}
