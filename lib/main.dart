import 'package:flutter/material.dart';
import "dart:math" as math show Random;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var backgroundColor = Colors.white;
  var isTextWhite = false;

  List getRandomColor() {
    /* A Function that returns a list of [randomColor, isTextWhite] */
    final Color randomColor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    final bool isTextWhite = (randomColor.red * 0.299 +
                randomColor.green * 0.587 +
                randomColor.blue * 0.114) >
            186
        ? false
        : true;
    return [randomColor, isTextWhite];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final results = getRandomColor();

        setState(() {
          backgroundColor = results[0];
          isTextWhite = results[1];
        });
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Text(
            "Hey There",
            style: TextStyle(color: isTextWhite ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
