import 'package:flutter/material.dart';
import 'package:quiz_app_lum/model/questionlist.dart';
import 'package:quiz_app_lum/view/result_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Color maincolor = Color.fromARGB(255, 145, 151, 147);
  Color secondcolor = Color.fromARGB(255, 146, 146, 186);
  PageController? _controller = PageController(initialPage: 0);
  bool ispressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color Btncolor = Color.fromARGB(255, 21, 226, 35);
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Padding(
        padding: EdgeInsets.all(50),
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller!,
          onPageChanged: (Page) {
            setState(() {
              ispressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return ListView(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Text(
                    "Question ${index + 1}/ ${questions.length}",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w300,
                        fontSize: 25.0),
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: 8.0,
                  thickness: 1.0,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  questions[index].question!,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
                SizedBox(
                  height: 100,
                ),
                for (int i = 0; i < questions[index].answer!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 18),
                    child: MaterialButton(
                      shape: StadiumBorder(),
                      color: ispressed
                          ? questions[index].answer!.entries.toList()[i].value
                              ? isTrue
                              : isWrong
                          : secondcolor,
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      onPressed: ispressed
                          ? () {}
                          : () {
                              setState(() {
                                ispressed = true;
                              });
                              if (questions[index]
                                  .answer!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score += 10;
                                print(score);
                              }
                            },
                      child: Text(questions[index].answer!.keys.toList()[i]),
                    ),
                  ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: ispressed
                          ? index + 1 == questions.length
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Resultscreen(score)));
                                }
                              : () {
                                  _controller!.nextPage(
                                      duration: (Duration(milliseconds: 500)),
                                      curve: Curves.linear);
                                  setState(() {
                                    ispressed = false;
                                  });
                                }
                          : null,
                      color: Color.fromARGB(255, 55, 65, 99),
                      child: Text(
                        index + 1 == questions.length
                            ? "See results"
                            : "Next Question",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
