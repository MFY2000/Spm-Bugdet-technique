// ignore_for_file: file_names

import 'package:budget_calculator/Custom/Buttton.dart';
import 'package:budget_calculator/Custom/Contain.dart';
import 'package:budget_calculator/Custom/Heading/Heading1.dart';
import 'package:budget_calculator/Pages/UseCasePoint/TechnicalFactor.dart';
import 'package:budget_calculator/Pages/UseCasePoint/UserInput.dart';
import 'package:flutter/material.dart';

class UseCasePoint extends StatefulWidget {
  const UseCasePoint({Key? key}) : super(key: key);

  @override
  _UseCasePointState createState() => _UseCasePointState();
}

class _UseCasePointState extends State<UseCasePoint> {
  late int onCalculate = 0;
  late List<String> lstToReturn = ["0.0", "0.0"];
  late String printAnswer = "";
  late double UUCW = 0;
  late double UAW = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Heading1(heading: 'Use Case Point',type: true,),
                  
                  const UserInput(childName: "UUCW"),
                  const UserInput(childName: "UAW",),
                  const TechnicalFactor(typeFacorte: true,), 
                  const TechnicalFactor(typeFacorte: false,), 
                  
                  CalculateButton(calculate: calculate),
                  
                  onCalculate == 0 ? Container() : (onCalculate == 1 ? const CircularProgressIndicator() : getResult()),
                ])));
  }


   getResult() {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 400,
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 51, 204, 255), width: 1),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
          child: Text(
            printAnswer,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 15,
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Positioned(
            left: 50,
            top: 12,
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              color: Colors.white,
              child: const Text(
                'Solution',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            )),
      ],
    );
  }

  calculate() {
    setState(() {
      onCalculate = 1;
    });

    if (validation()) {
      double UUCP = UAW + UUCW;

      printAnswer += lstToReturn[0];
      printAnswer += "\n";

      printAnswer += lstToReturn[1];
      printAnswer += "\n";

      printAnswer += "UUCP = UAW + UUCW";
      printAnswer += "\n";
      printAnswer += "UUCP = $UUCP";
      setState(() {
        onCalculate = 2;
      });
    } else {
      setState(() {
        onCalculate = 0;
      });
    }
  }

  bool validation() {
    if (UUCW == 0.0) {
      return false;
    } else if (UUCW == 0.0) {
      return false;
    } else {
      return true;
    }
  }
}
