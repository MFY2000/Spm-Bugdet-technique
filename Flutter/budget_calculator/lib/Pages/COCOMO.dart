// ignore_for_file: file_names, prefer_const_constructors

import 'dart:math';

import 'package:budget_calculator/Custom/Contain.dart';
import 'package:budget_calculator/Custom/TextFeildCustom.dart';
import 'package:flutter/material.dart';

class CocomoCalculator extends StatefulWidget {
  const CocomoCalculator({Key? key}) : super(key: key);

  @override
  _CocomoCalculatorState createState() => _CocomoCalculatorState();
}

class _CocomoCalculatorState extends State<CocomoCalculator> {
  TextEditingController inputTextKLOC = TextEditingController();

  String ResultToString = "";
  var Result;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 40),
          alignment: Alignment.centerLeft,
          child: const Text(
            'COCOMO',
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
        ),
        TextFeildCustom(
          width_: 0.75,
          taskInput: inputTextKLOC,
          inputLabel: "Enter the value of LOC", isValid: false,
        ),
        TextButton(
            onPressed: () => {calculateSlim()},
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .0125),
              width: MediaQuery.of(context).size.width * .75,
              height: MediaQuery.of(context).size.height * .05,
              alignment: Alignment.center,
              child: Text(
                "Calculate",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
            )),
        ResultToString.isNotEmpty ? getResult() : Container(),
      ],
    );
  }

  getResult() {
    return Contain(resultToString: ResultToString);
  }

  calculateSlim() {
    num kloc = getTextFromFeild(inputTextKLOC);
    var effort, dT;

    setState(() {
      if (kloc <= 50 && kloc >= 2) {
        effort = 2.4 * pow(kloc, 1.05);
        ResultToString += "organic effort: $effort person / month";
        ResultToString += "\n";

        dT = 2.5 * pow(effort, 0.38);
        ResultToString += " dev. time: $dT";
      } else if (kloc > 50 && kloc <= 300) {
        effort = 3 * pow(kloc, 1.12);
        ResultToString += "semi effort: $effort person / month";
        ResultToString += "\n";

        dT = 2.5 * pow(effort, 0.35);
        ResultToString += "semi dev. time : $dT";
      } else {
        effort = 3.6 * pow(kloc, 1.20);
        ResultToString += "embedded effort: $effort person / month";
        ResultToString += "\n";

        dT = 2.5 * pow(effort, 0.32);
        ResultToString += "embedded dev. time : $dT";
      }
    });
  }

  num getTextFromFeild(var feild) {
    return num.parse(feild.value.text);
  }
}
