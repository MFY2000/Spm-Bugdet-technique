// ignore_for_file: file_names, non_constant_identifier_names

import 'package:budget_calculator/Custom/Buttton.dart';
import 'package:budget_calculator/Custom/DropDown.dart';
import 'package:budget_calculator/Custom/PopupAlert.dart';
import 'package:budget_calculator/Custom/Solution/SolutionTemplete.dart';
import 'package:budget_calculator/Model/FunctionalModel.dart';
import 'package:budget_calculator/Pages/Functional%20Point/ScaleFactor.dart';
import 'package:budget_calculator/Pages/Functional%20Point/UAF/UserWeightFactor.dart';
import 'package:budget_calculator/Pages/Functional%20Point/UserTextInputs.dart';
import 'package:flutter/material.dart';

class FunctionalPoint extends StatefulWidget {
  List<Functional> input;
  FunctionalPoint({Key? key, required this.input}) : super(key: key);

  @override
  _FunctionalPointState createState() => _FunctionalPointState();
}

class _FunctionalPointState extends State<FunctionalPoint> {
  late List<Functional> inputState;

  late double widht, height;

  late String toReturn;

  late Map<String, String> error = {"head": "", "body": ""};
  late bool isError = false;
  late bool onPressScale = true;
  late bool onPressWeight = true;

  late double functionalPoint;

  int onCalculate = 0;

  @override
  void initState() {
    // TODO: implement initState
    onPressScale = true;
    onPressWeight = true;

    toReturn = "";

    inputState = widget.input;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widht = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: widht * .1),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Functional Point',
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
            ),
            UserPoint(input: inputState, isError: isError),
            SizedBox(
              height: (height * .025),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Weighing factor",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
                DropDownLst(lstMethods: weightfactors, onSelect: weightSelect),
                IconButton(
                    onPressed: () => {onPressAdvance(true)},
                    icon: const Icon(
                      Icons.settings_suggest,
                      size: 22,
                    ))
              ],
            ),
            !onPressWeight ? const UserWeightFactor() : Container(),
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "CAF (${onPressScale ? "Default" : "Dynamic"})",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
                DropDownLst(lstMethods: weightScale, onSelect: factoreSelect),
                IconButton(
                    onPressed: () => {onPressAdvance(false)},
                    icon: const Icon(
                      Icons.settings_suggest,
                      size: 22,
                    ))
              ],
            ),
            !onPressScale ? const ScaleFactor() : Container(),
            CalculateButton(
              calculate: calculate,
            ),
            onCalculate == 0
                ? Container()
                : (onCalculate == 1
                    ? const CircularProgressIndicator()
                    : getResult()),
          ],
        ));
  }

  onPressAdvance(bool turn) {
    bool match = (turn
            ? multipleWeight["Type"].length
            : multipleScale["Scale"].length) ==
        0;

    if (!match) {
      setState(() {
        if (turn) {
          onPressWeight = !onPressWeight;
        } else {
          onPressScale = !onPressScale;
        }
      });
    } else {
      popupAlert(context, "${turn ? "Weight" : "Scale"} is Empty",
          "Pls select any of following as default");
    }
  }

  calculate() {
    int change = 1;
    setState(() {
      onCalculate = change;
      isError = validation();
    });

    if (isError) {
      num CAF = calculateCAF();
      num UCP = calculateUCP();
      print("$UCP");

      num functionalPoint = CAF * UCP;
      defaultsSteps[10] += "$CAF * $UCP";
      defaultsSteps[11] += "$functionalPoint";
      change = 2;
    } else {
      change = 0;
      if (error["head"]!.isNotEmpty) {
        popupAlert(context, error["head"] ?? "", error["body"] ?? "");
      }
    }

    setState(() {
      onCalculate = change;
      if (change == 0) {
        error["head"] = "";
        error["body"] = "";
      }
    });
  }

  calculateFactor() {
    num ans = 0;
    multipleScale["weight"][0] = getLimitLeft();
    bool match;

    for (var i = 0; i < multipleScale["weight"].length; i++) {
      match = i < multipleScale["weight"].length;
      defaultsSteps[1] +=
          "${multipleScale["weight"][i]} * ${multipleScale["Scale"][i]} ${match ? "+" : ""} ";
      ans += multipleScale["weight"][i] * multipleScale["Scale"][i];
    }

    defaultsSteps[2] += "$ans";
    return ans;
  }

  calculateCAF() {
    num factor = calculateFactor();
    double ans = 0.65 + (0.01 * factor);

    defaultsSteps[4] += "$factor)";
    defaultsSteps[5] += "$ans";

    return ans;
  }

  calculateUCP() {
    num ufpCalculation = 0;

    if (multipleWeight["weight"].isEmpty) {
      var weight = multipleWeight["weight"];
      var limit = multipleWeight["Limit"];
      for (var i = 0; i < 5; i++) {
        weight.add([inputControllerFP[i].value]);
        limit.add(inputControllerFP[i].value);
      }
      multipleWeight["weight"] = weight;
      multipleWeight["Limit"] = limit;
    }

    for (var i = 0; i < weightFactorsLenght; i++) {
      multipleWeight["weight"][i][0] = getWeightLeft(i);
      var item = multipleWeight["weight"][i];

      for (var j = 0; j < item.length; j++) {
        if (item[j] != 0) {
          int value = multipleWeight["Type"][i][j];
          value = value == 0 ? multipleWeight["Type"][i][0] : value;

          defaultsSteps[7] += "(${item[j]} * ${wtFactors[value][i]}) + ";
          ufpCalculation += item[j] * wtFactors[value][i];
        }
      }
    }
    defaultsSteps[7] =
        defaultsSteps[7].substring(0, (defaultsSteps[7].length - 3));
    defaultsSteps[8] += "$ufpCalculation";

    return ufpCalculation;
  }

  getResult() {
    return SolutionTemplete(headings: const {
      "Factors": [0, 3],
      "CAF": [3, 6],
      "UFP": [6, 9],
      "Functional Point(FP)": [9, 12]
    }, data: defaultsSteps);
  }

  void weightSelect(value) {
    for (var i = 0; i < weightfactors.length; i++) {
      if (weightfactors[i] == value) {
        setState(() {
          if (multipleWeight["Type"].length == 0) {
            multipleWeight["Type"] = [
              [i],
              [i],
              [i],
              [i],
              [i]
            ];
          } else {
            for (var j = 0; j < 5; j++) {
              multipleWeight["Type"][0][j] = i;
            }
          }
        });
      }
    }
  }

  void factoreSelect(value) {
    for (var i = 0; i < weightScale.length; i++) {
      if (weightScale[i] == value) {
        setState(() {
          if (multipleScale["Scale"].length == 0) {
            multipleScale["Scale"].add(i);
          } else {
            multipleScale["Scale"][0] = i;
          }
        });
      }
    }
  }

  bool validation() {
    bool match = true;
    for (var i = 0; i < multipleWeight["weight"].length; i++) {
      if (multipleWeight["weight"][i].control.value.text.isEmpty) {
        setState(() {
          multipleWeight["weight"][i].isValid = true;
          widget.input = multipleWeight["weight"];
        });
        match = false;
      }
    }

    if (multipleWeight["Type"].length == 0) {
      error["head"] = ("Select any Factor");
      error["body"] = ("Pls select any factor");
      match = false;
    }

    if (multipleScale["Scale"].length == 0) {
      if (error["head"]!.isNotEmpty) {
        error["head"] = "${error["head"]} and also weight";
        error["body"] = "${error["body"]} and weighting factor";
      } else {
        error["head"] = ("Select any weight");
        error["body"] = ("Pls select any weighting factor");
      }
      match = false;
    }

    return match;
  }
}
