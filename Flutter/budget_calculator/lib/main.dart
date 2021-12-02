import 'package:budget_calculator/Custom/DropDown.dart';
import 'package:budget_calculator/Model/FunctionalModel.dart';
import 'package:budget_calculator/Pages/COCOMO.dart';
import 'package:budget_calculator/Pages/Functional%20Point/FunctionalPoint.dart';
import 'package:budget_calculator/Pages/UseCasePoint/UCP.dart';
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
      home: const MyHomePage(title: "Software Project Management"),
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
  late List<String> lstMethods = [".....", "Slim", "COCOMO", "Functional Point", "Use Case Point"];
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

    switch (_counter) {
      case 1:
        toReturn = const SLIMCalculator();
        break;
      case 2:
        toReturn = const CocomoCalculator();
        break;
      case 3:
        for (var item in inputStringFP) {
          inputControllerFP.add(Functional(item));
        }
        toReturn = FunctionalPoint(input: inputControllerFP);
        break;
      case 4:
        toReturn = const UseCasePoint();
        break;
      default:
      
        toReturn = Container(); //Container();

    }


    return toReturn;
  }

  getAllUserInput(List<String> element){
    
  }

}


