import 'package:flutter/material.dart';
import 'package:quiz_app_lum/view/splashscreen.dart';

void main() {
  runApp(const Quizapp());
}

class Quizapp extends StatelessWidget {
  const Quizapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
