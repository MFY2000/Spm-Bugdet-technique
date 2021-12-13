// ignore_for_file: file_names, non_constant_identifier_names

import 'package:budget_calculator/Custom/Buttton.dart';
import 'package:budget_calculator/Custom/DropDown.dart';
import 'package:budget_calculator/Custom/PopupAlert.dart';
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
    bool match = (turn ? multipleWeight["Type"].length : multipleScale["Scale"].length) == 0;

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
      int UCP = calculateUCP();

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

    defaultsSteps[2] = "$ans";
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
    int UFP = 0;
    String ufpCalculation = "";

    multipleWeight["weight"][0] = getLimitLeft();

    String temp = "";

    // var weight = wtFactors[weightSelection];
    if (onPressWeight) {
      for (var i = 0; i < inputState.length; i++) {
        temp = i < (inputState.length - 1) ? "+" : "";

        // UFP += weight[i] * inputState[i].getData();

        // ufpCalculation += "(${weight[i]} * ${inputState[i].getData()}) $temp ";
      }
    } else {
      var weightingUFP = multipleWeight["weight"],
          typeUFP = multipleWeight["Type"],
          limitUFP = multipleWeight["Limit"],
          item1 = [],
          item2 = [];

      num sum = 0;

      String toString = "";


      int i = 0, j = 0;
      for (var itemweight in weightingUFP) {
        item2 = typeUFP[i];
        j = 0;

        for (var item in itemweight) {
          toString += i == 0 ? "" : "+";
          sum += (item * item2[j]);
          toString += "($item * ${item2[j]})";
          j++;
        }
        i++;
      }

      print("$toString   [ $sum,]");
    }

    toReturn += "\n";
    toReturn += "UFP = $ufpCalculation";
    toReturn += "\n";
    toReturn += "UFP = $UFP";
    toReturn += "\n";

    return UFP;
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
            toReturn,
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

  void weightSelect(value) {
    for (var i = 0; i < weightfactors.length; i++) {
      if (weightfactors[i] == value) {
        setState(() {
          multipleWeight["Type"] = [[i], [i], [i], [i], [i]];
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
    for (var i = 0; i < inputState.length; i++) {
      if (inputState[i].isFill()) {
        setState(() {
          inputState[i].isValid = true;
          widget.input = inputState;
        });
      }
      match = false;
    }

    if (multipleWeight["Type"].length != 0) {
      error["head"] = ("Select any Factor");
      error["body"] = ("Pls select any factor");
      match = false;
    }

    if (multipleScale["Scale"].length != 0) {
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
