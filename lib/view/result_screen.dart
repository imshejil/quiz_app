import 'package:flutter/material.dart';
import 'package:quiz_app_lum/view/home_page.dart';

class Resultscreen extends StatefulWidget {
  final int score;
  const Resultscreen(this.score, {super.key});

  @override
  State<Resultscreen> createState() => _ResultscreenState();
}

class _ResultscreenState extends State<Resultscreen> {
  @override
  Widget build(BuildContext context) {
    Color maincolor = Color.fromARGB(255, 33, 51, 68);

    return Scaffold(
      backgroundColor: maincolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "CONGRATULATIONS ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your Score is :",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "${widget.score}",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 80,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homescreen()));
              },
              elevation: 0.0,
              color: Colors.amber,
              textColor: Colors.black,
              child: Text("Repeat the Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
