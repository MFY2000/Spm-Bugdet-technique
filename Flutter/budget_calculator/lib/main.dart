import 'package:budget_calculator/Custom/DropDown.dart';
import 'package:budget_calculator/Pages/COCOMO.dart';
import 'package:budget_calculator/Pages/FunctionalPoint.dart';
import 'package:flutter/material.dart';

import 'Pages/SLIM.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FunctionalPoint(),
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
  late int _counter = 0;
  late List<String> lstMethods = [".....", "Slim", "COCOMO"];
  var widht, height;

  void onSelctionIn(String value) {
    int index = 0;

    for (var i = 0; i < lstMethods.length; i++) {
      if (lstMethods[i] == value) {
        index = i;
      }
    }

    setState(() {
      _counter = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    widht = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Container(
              padding: EdgeInsets.symmetric(vertical: height * .035),
              child: const Text(
                  'Budgeting technique: ',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
            DropDownLst(lstMethods: lstMethods, onSelect: onSelctionIn),
            SizedBox(
              height: MediaQuery.of(context).size.height * .035,
            ),

            calculator(),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget calculator() {
    Widget toReturn;

    if (_counter == 1) {
      toReturn = const SLIMCalculator();
    } else if (_counter == 2) {
      toReturn = const CocomoCalculator();
    } else {
      toReturn = Container();
    }

    return toReturn;
  }
}
