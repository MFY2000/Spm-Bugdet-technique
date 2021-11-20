// ignore_for_file: file_names

import 'package:budget_calculator/Custom/Contain.dart';
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
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Use Case Point',
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'UUCW',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                  UserInput(
                    lstWeight: [5, 10, 15],
                    noOfChild: 3,
                    onchange: onChange,
                    index: 0,
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'UUCW',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                  UserInput(
                    lstWeight: [1, 2, 3],
                    noOfChild: 3,
                    onchange: onChange,
                    index: 1,
                  ),
                  TextButton(
                      onPressed: calculate,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .0125),
                        width: MediaQuery.of(context).size.width * .75,
                        height: MediaQuery.of(context).size.height * .05,
                        alignment: Alignment.center,
                        child: const Text(
                          "Calculate",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                      )),
                  onCalculate == 0
                      ? Container()
                      : (onCalculate == 1
                          ? const CircularProgressIndicator()
                          : getResult()),
                ])));
  }

  onChange(String toReturn, int index, double answer) {
    index == 0 ? UUCW = answer : UAW = answer;

    lstToReturn[index] = "${index == 0 ? "UUCW" : "UAW"} = $toReturn";
    lstToReturn[index] += "${index == 0 ? "UUCW" : "UAW"} = $answer";
    lstToReturn[index] += "\n";

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
