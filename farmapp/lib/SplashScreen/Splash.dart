import 'package:farmapp/LoginScreen/Login.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 56, 121, 233),
      body: Center(
        child: Text(
          "DairyCare",
          style: TextStyle(
              fontFamily: 'Recoleta',
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

// class TextScreen extends StatefulWidget {
//   const TextScreen({Key? key}) : super(key: key);

//   @override
//   _TextScreenState createState() => _TextScreenState();
// }

// class _TextScreenState extends State<TextScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const NextPage()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Text(
//           'Text Appears!',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
