// ignore_for_file: file_names

import 'package:budget_calculator/Custom/Contain.dart';
import 'package:budget_calculator/Custom/DropDown.dart';
import 'package:budget_calculator/Custom/TextFeildCustom.dart';
import 'package:budget_calculator/Pages/Functional%20Point/Model/FunctionalModel.dart';
import 'package:budget_calculator/Pages/Functional%20Point/UserPoints.dart';
import 'package:flutter/material.dart';

class FunctionalPoint extends StatefulWidget {
  FunctionalPoint({Key? key}) : super(key: key);

  late bool error;
  late List<List<int>> lstScale = [];
  late List<List<int>> lstweight = [];
  
  @override
  _FunctionalPointState createState() => _FunctionalPointState();
}

class _FunctionalPointState extends State<FunctionalPoint> {
  List<Functional> userInput = [];
  List<String> weightfactors = [];
  List<String> weightScale = [];
  
  int scaleLft = 14;
  int dividedScale = 0 ,weightSelection = 0, facotreSelection = 0;

  @override
  void initState() {
    // TODO: implement initState
    userInput = inputControllerFP;
    weightfactors = ["....", "High", "Average ", "Low"];
    weightScale = ["....",    "No influence",    "Incidental",    "Moderate",    "Average",    "Significant",    "Essential" ];
  
    weightSelection = 0;
    facotreSelection = 0;

    scaleLft = 14;
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

                //  onbuttonclick
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [],
                  ),
                ),

                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        "CAF ($scaleLft)",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ),
                    DropDownLst(lstMethods: weightScale, onSelect: factoreSelect),
                    IconButton(
                        onPressed: () => {},
                        icon: const Icon(
                          Icons.settings_suggest,
                          size: 22,
                        ))
                  ],
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
              ],
            )));
  }

  calculate() {
    if(validation()){
  // 
    int factor;
    double CAF, UCP; 
    double functionalPoint;
  // 

    factor = calculateFactor();
    CAF = calculateCAF(factor);
    
    UCP = calculateUCP();   

    functionalPoint = CAF * UCP;

    }
  }

  calculateFactor(){
    Map<String, dynamic> toReturn = {}; 
    int ans = (scaleLft * facotreSelection);

    String step = "F = scale * facotreSelected";
    step += "\n";
    step += "F = $scaleLft * $facotreSelection";
    step += "\n";
    step += "F = $ans";
    step += "\n";

    toReturn.putIfAbsent("Answer", () => ans);
    toReturn.putIfAbsent("Steps", () => step);

    return toReturn;
  }

  calculateCAF(int factor){
    return (0.65 + (0.01 * factor));
  }

  calculateUCP(){
    int UFP = 0;
    var weight = wtFactors[weightSelection];
    for (var i = 0; i < userInput.length; i++) {
      UFP +=  weight![i] * userInput[i].getData();
    }
  }
  

  getResult() {
    return Contain(resultToString: "");
  }


  void weightSelect(value) {
    for (var i = 0; i < weightfactors.length; i++) {
      if (weightfactors[i] == value) {
        setState(() {
          weightSelection = i;
          // widget.lstweight[dividedScale] = [i];
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
        print("pls select");
          return false;
      }
          return false;
    }

    return true;
  }

}
