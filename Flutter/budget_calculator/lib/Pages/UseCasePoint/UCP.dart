// ignore_for_file: file_names

import 'package:budget_calculator/Custom/Buttton.dart';
import 'package:budget_calculator/Custom/Contain.dart';
import 'package:budget_calculator/Custom/Heading/Heading1.dart';
import 'package:budget_calculator/Custom/Solution/SolutionTemplete.dart';
import 'package:budget_calculator/Model/FunctionalModel.dart';
import 'package:budget_calculator/Model/UseCaseModel.dart';
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
                  const Heading1(
                    heading: 'Use Case Point',
                    type: true,
                  ),

                  const UserInput(childName: "UUCW"),
                  const UserInput(childName: "UAW"),
                  
                  const TechnicalFactor(
                    typeFacorte: true,
                  ),
                  const TechnicalFactor(
                    typeFacorte: false,
                  ),
                  CalculateButton(calculate: calculate),
                  onCalculate == 0
                      ? Container()
                      : (onCalculate == 1
                          ? const CircularProgressIndicator()
                          : getResult()),
                ])));
  }

  getResult() {
    return SolutionTemplete(headings: const {
      "UUCP": [0, 9],
      "TF": [9, 12],
      "EF": [12, 15],
      "Use Case Point(UCP)": [15, 18]
    }, data: defualtStep);
  }

  calculate() {
    
    num uucp = 0, tc = 0, ef = 0;
    setState(() {
      onCalculate = 1;
    });

    uucp = input["UUCP"]["UUCW"] + input["UUCP"]["UAW"];
    defualtStep[7] = "UUCP = ${input["UUCP"]["UUCW"]} + ${input["UUCP"]["UAW"]}";
    defualtStep[8] = "UUCP = $uucp";

    tc = 0.6 + (0.01 * input["UUCP"]["TC"]);
    defualtStep[10] = "TCF = 0.6 + (0.01 * ${input["UUCP"]["TC"]})";
    defualtStep[11] = "TCF = $tc";
    
    ef = 1.4 + (-0.03 * input["UUCP"]["EF"]);
    defualtStep[13] = "EF = 1.4 + (-0.03 * ${input["UUCP"]["EF"]})";
    defualtStep[14] = "EF = $ef";
    
    defualtStep[16] = "UCP = $uucp * $tc * $ef";
    defualtStep[17] = "UCP = ${uucp * tc * ef}";
    
    setState(() {
      onCalculate = 2;
    });
  }
}
