// ignore_for_file: file_names

import 'package:budget_calculator/Custom/DropDown.dart';
import 'package:budget_calculator/Model/FunctionalModel.dart';
import 'package:budget_calculator/Pages/Functional%20Point/ScaleFactor.dart';
import 'package:budget_calculator/Pages/Functional%20Point/UserPoints.dart';
import 'package:flutter/material.dart';

class FunctionalPoint extends StatefulWidget {
  FunctionalPoint({Key? key}) : super(key: key);

  late bool error;
  late Map<String, List<int>> multipleweight = {};

  @override
  _FunctionalPointState createState() => _FunctionalPointState();
}

class _FunctionalPointState extends State<FunctionalPoint> {
  List<Functional> userInput = [];
  List<String> weightfactors = [];
  List<String> weightScale = [];

  int dividedScale = 0, weightSelection = 0, facotreSelection = 0;

  String toReturn = "";
  
  late bool onPressScale = true;
  late int factor;
  late double CAF, UCP;
  late double functionalPoint;

  int onCalculate = 0;

  @override
  void initState() {
    // TODO: implement initState
    userInput = inputControllerFP;
    weightfactors = ["....", "High", "Average ", "Low"];
    weightScale = [
      "....",
      "No influence",
      "Incidental",
      "Moderate",
      "Average",
      "Significant",
      "Essential"
    ];

    weightSelection = 0;
    facotreSelection = 0;

    onPressScale = true;
    super.initState();
  }

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
                    'Functional Point',
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                  ),
                ),
                const UserPoint(),

                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Text(
                        "Weight Factors",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ),
                    DropDownLst(
                        lstMethods: weightfactors, onSelect: weightSelect),
                    IconButton(
                        onPressed: () => {},
                        icon: const Icon(
                          Icons.settings_suggest,
                          size: 22,
                        ))
                  ],
                ),
                

                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Text(
                        "CAF",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ),
                    onPressScale ? DropDownLst(
                        lstMethods: weightScale, onSelect: factoreSelect): Container(),
                    IconButton(
                        onPressed: () => {
                          setState(() {
                            onPressScale = !onPressScale; 
                          })
                        },
                        icon: const Icon(
                          Icons.settings_suggest,
                          size: 22,
                        ))
                  ],
                ),

                !onPressScale ? ScaleFactor(weightfactors: weightScale, limit: 14,): Container(),

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

                    onCalculate == 0 ? 
                      Container():
                      (onCalculate == 1 ? const CircularProgressIndicator(): getResult()),

              ],
            )));
  }

  calculate() {
    setState(() {
      onCalculate = 1;
    });

    if (validation()) {
      //

      toReturn = "";
      //

      factor = calculateFactor();
      CAF = calculateCAF(factor);

      UCP = calculateUCP();

      functionalPoint = CAF * UCP;
    
      toReturn += "\n";
      toReturn += "FP = CAF * UFP";
      toReturn += "\n";
      toReturn += "FP = $functionalPoint";

      setState(() {
        onCalculate = 2;
      });
    }
  }

  calculateFactor() {
    int ans = (14 * facotreSelection);

    toReturn += "F = scale * facotreSelected";
    toReturn += "\n";
    toReturn += "F = 14 * $facotreSelection";
    toReturn += "\n";
    toReturn += "F = $ans";
    toReturn += "\n";

    return ans;
  }

  calculateCAF(int factor) {
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
    for (var i = 0; i < userInput.length; i++) {

      temp = i < (userInput.length-1) ? "+": "";
      
      UFP += weight[i] * userInput[i].getData();
      ufpCalculation += "(${weight[i]} * ${userInput[i].getData()}) $temp ";
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
          weightSelection = i-1;
        });
      }
    }
  }

  void factoreSelect(value) {
    for (var i = 0; i < weightScale.length; i++) {
      if (weightScale[i] == value) {
        setState(() {
          facotreSelection = i-1;
        });
      }
    }
  }

  bool validation() {
    for (var item in userInput) {
      if (item.isFill()) {
        setState(() {
          widget.error = true;
          item.changeState();
        });
        return false;
      }
    }

    if (facotreSelection == 0) {
      if (weightSelection == 0) {
        return false;
      }
      return false;
    }

    return true;
  }
}
