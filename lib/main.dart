import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Dicee',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int leftDiceNum = 1;
  int rightDiceNum = 6;

  void changeDiceFace(){

    var random = Random();

    int min = 1;
    int max = 6;

    leftDiceNum = min + random.nextInt(max);
    rightDiceNum = min + random.nextInt(max);

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    changeDiceFace();
                    print("the number of dice is $leftDiceNum");
                  });
                },
                child: Image.asset("images/dice$leftDiceNum.png")),
          ),
          Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeDiceFace();
                      print("the number of dice is $rightDiceNum");

                    });
                  },
                  child: Image.asset("images/dice$rightDiceNum.png")))
        ],
      ),
    );
  }
}
