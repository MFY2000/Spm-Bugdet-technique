// ignore_for_file: file_names, non_constant_identifier_names

import 'package:budget_calculator/Custom/DropDown.dart';
import 'package:budget_calculator/Custom/PopupAlert.dart';
import 'package:budget_calculator/Model/FunctionalModel.dart';
import 'package:budget_calculator/Pages/Functional%20Point/ScaleFactor.dart';
import 'package:budget_calculator/Pages/Functional%20Point/UserPoints.dart';
import 'package:budget_calculator/Pages/Functional%20Point/UserWeightFactor.dart';
import 'package:flutter/material.dart';

class FunctionalPoint extends StatefulWidget {
  List<Functional> input;
  FunctionalPoint({Key? key, required this.input}) : super(key: key);

  @override
  _FunctionalPointState createState() => _FunctionalPointState();
}

class _FunctionalPointState extends State<FunctionalPoint> {
  late List<Functional> inputState;

  late int weightSelection, facotreSelection;
  late double widht, height;

  late String toReturn;

  late Map<String, String> error = {"head": "", "body": ""};
  late bool isError = false;
  late bool onPressScale = true;
  late bool onPressWeight = true;

  late int factor;
  late double CAF, UCP;
  late double functionalPoint;

  int onCalculate = 0;

  @override
  void initState() {
    // TODO: implement initState
    weightSelection = 0;
    facotreSelection = 0;

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
            !onPressWeight
                ? UserWeightFactor(weightfactors: weightSelection)
                : Container(),
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
            !onPressScale
                ? ScaleFactor(
                    weightfactors: weightScale,
                    limit: 15,
                  )
                : Container(),
            TextButton(
                onPressed: calculate,
                child: Container(
                  margin: EdgeInsets.only(top: height * .0125),
                  width: widht * .75,
                  height: height * .05,
                  alignment: Alignment.center,
                  child: const Text(
                    "Calculate",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0))),
                )),
            onCalculate == 0
                ? Container()
                : (onCalculate == 1
                    ? const CircularProgressIndicator()
                    : getResult()),
          ],
        ));
  }

  onPressAdvance(bool turn) {
    bool match = (turn ? weightSelection : facotreSelection) == 0;

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
    setState(() {
      onCalculate = 1;
      isError = validation();
    });
    if (isError) {
      toReturn = "";
      factor = calculateFactor();
      CAF = calculateCAF();
      UCP = calculateUCP();

      functionalPoint = CAF * UCP;

      toReturn += "\n";
      toReturn += "FP = CAF * UFP";
      toReturn += "\n";
      toReturn += "FP = $functionalPoint";

      setState(() {
        onCalculate = 2;
      });
    } else {
      // print(error.isNotEmpty);
      // if (error["head"]!.isNotEmpty) {
      //   popupAlert(context, error["head"] ?? "", error["body"] ?? "");
      // }

      setState(() {
        onCalculate = 0;
        error["head"] = "";
        error["body"] = "";
      });
    }
  }

  calculateFactor() {
    int ans = 0;
    toReturn += "F = scale * facotreSelected";
    toReturn += "\n";

    if (onPressScale) {
      ans = (14 * facotreSelection);
      toReturn += "F = 14 * $facotreSelection";
    } else {
      String temp;
      toReturn += "F = ";
      for (var i = 0; i < multipleScale.values.first.length; i++) {
        temp = i < multipleScale.values.first.length - 1 ? "+" : "";
        ans += (multipleScale["weight"]![i] * multipleScale["Scale"]![i]);
        toReturn +=
            "(${multipleScale["weight"]![i]} * ${multipleScale["Scale"]![i]}) $temp";
      }
    }
    toReturn += "\n";
    toReturn += "F = $ans";
    toReturn += "\n";

    return ans;
  }

  calculateCAF() {
    double ans = 0.65 + (0.01 * factor);

    toReturn += "\n";
    toReturn += "CAF = 0.65 + (0.01 * factor)";
    toReturn += "\n";
    toReturn += "C = 0.65 + (0.01 * $factor)";
    toReturn += "\n";
    toReturn += "C = $ans";
    toReturn += "\n";

    return ans;
  }

  calculateUCP() {
    int UFP = 0;
    String ufpCalculation = "";
    toReturn += "\n";
    toReturn += "UFP = (UI * EI)+(UO * EO)+(UQ * EQ)+(ELF * ILF)+(UIF * EIF)";

    String temp = "";

    var weight = wtFactors[weightSelection];
    if (onPressWeight) {
      for (var i = 0; i < inputState.length; i++) {
        temp = i < (inputState.length - 1) ? "+" : "";
        UFP += weight[i] * inputState[i].getData();
        ufpCalculation += "(${weight[i]} * ${inputState[i].getData()}) $temp ";
      }
    } else {
      var weightingUFP = multipleWeight["weight"],
          typeUFP = multipleWeight["Type"],
          limitUFP = multipleWeight["Limit"],
          item1 = [],
          item2 = [];

      num sum = 0;

      String toString = "";

      // for (var i = 0; i < weightingUFP.length; i++) {
      //   for (var j = 0; j < weightingUFP[i].length; j++) {
      //     if(j != 0){
      //       sum += weightingUFP[i][j];
      //     }
      //   }

      //   weightingUFP[i][0] = limitUFP[i] -  sum;
      // }

      int i = 0, j = 0;
      for (var itemweight in weightingUFP) {
        item2 = typeUFP[i];
        j = 0;

        print(itemweight);

        for (var item in itemweight) {
          toString += i == 0 ? "" : "+";
          sum += (item * item2[j]);
          toString += "($item * ${item2[j]})";
          j++;
        }
        i++;
      }
      // for (var i = 0; i < weightingUFP.length; i++) {
      //   item1 = weightingUFP[i];

      //   for (var j = 0; j < item1.length; j++) {
      //     toString += i == 0 ? "" : "+";
      //     sum += (item1[j] * item2[j])!;
      //     toString += "(${item1[j]} * ${item2[i]})";
      //   }
      // }

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
          weightSelection = i;
        });
      }
    }
  }

  void factoreSelect(value) {
    for (var i = 0; i < weightScale.length; i++) {
      if (weightScale[i] == value) {
        setState(() {
          facotreSelection = i;
        });
      }
    }
  }

  bool validation() {
    bool match = true;

    // for (var i = 0; i < inputState.length; i++) {
    //   if (inputState[i].isFill()) {
    //     setState(() {
    //       inputState[i].isValid = true;
    //       widget.input = inputState;
    //     });
    //   }
    //   match = false;
    // }

    if (facotreSelection != 0) {
      error["head"] = ("Select any Factor");
      error["body"] = ("Pls select any factor");
      match = false;
    }

    if (weightSelection != 0) {
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
