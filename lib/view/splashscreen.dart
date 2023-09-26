import 'package:flutter/material.dart';
import 'package:quiz_app_lum/view/home_page.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homescreen(),
          ));
    });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 51, 68),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 400,
              width: 400,
              child: Image.asset(
                "Assets/quiz logo.png",
                height: 300,
                width: 300,
              ),
            ),
          ),
          Text(
            "BRAIN MASTER",
            style: TextStyle(
                color: Colors.orange,
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          CircularProgressIndicator(
            color: Colors.orange,
          )
        ],
      ),
    );
  }
}
