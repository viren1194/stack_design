import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stack_design/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      },));
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: const Text("Wallpaper"),),
    );
  }
}