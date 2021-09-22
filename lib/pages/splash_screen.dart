import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedex/pages/main_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191B1D),
      body: Container(
        child: Center(
          child: Image.asset("assets/pokeball.gif"),
        ),
      )
    );
  }
}
