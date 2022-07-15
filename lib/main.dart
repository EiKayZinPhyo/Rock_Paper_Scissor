import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var number = 3;
  var number1 = 3;

  var numberList = [1, 2, 3];
  var txt = '';

  void roll1() {
    setState(() {
      numberList.shuffle();
      print(number);
      number = numberList[0];
    });
  }

  void roll2() {
    setState(() {
      numberList.shuffle();
      print(number1);
      number1 = numberList[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF58B19F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Player 1",
                    style: GoogleFonts.asul(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      roll1();
                    },
                    child: Image.asset(width: 100, "assets/pic$number.png"),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Player 2",
                    style: GoogleFonts.asul(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      roll2();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Image(
                        width: 100,
                        image: AssetImage("assets/pic$number1.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // ignore: curly_braces_in_flow_control_structures
                setState(() {
                  if (number == 1 && number1 == 2 ||
                      number == 2 && number1 == 3 ||
                      number == 3 && number1 == 1) {
                    setState(() {
                      txt = "Player 1 win";
                    });
                  } else if (number == 2 && number1 == 1 ||
                      number == 3 && number1 == 2 ||
                      number == 1 && number1 == 3) {
                    setState(() {
                      txt = "Player 2 win";
                    });
                  } else {
                    setState(() {
                      txt = "draw";
                    });
                  }
                });
              },
              style: ElevatedButton.styleFrom(primary: Colors.white),
              child: Text(
                "Check Who Win",
                style: GoogleFonts.bitter(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            txt,
            style: GoogleFonts.alice(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 30,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
