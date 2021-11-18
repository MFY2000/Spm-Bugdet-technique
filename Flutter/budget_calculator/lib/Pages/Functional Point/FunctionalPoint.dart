// ignore_for_file: file_names

import 'package:budget_calculator/Custom/DropDown.dart';
import 'package:budget_calculator/Custom/TextFeildCustom.dart';
import 'package:budget_calculator/Pages/Functional%20Point/Model/FunctionalModel.dart';
import 'package:budget_calculator/Pages/Functional%20Point/UserPoints.dart';
import 'package:flutter/material.dart';

class FunctionalPoint extends StatefulWidget {
  late bool error;
  FunctionalPoint({Key? key}) : super(key: key);

  @override
  _FunctionalPointState createState() => _FunctionalPointState();
}

class _FunctionalPointState extends State<FunctionalPoint> {
  var userInput = inputControllerFP;
  List<String> weightfactors = ["....", "High", "Average ", "Low"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
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
                        lstMethods: weightfactors, onSelect: (String) => {}),
                    IconButton(
                        onPressed: () => {},
                        icon: const Icon(
                          Icons.dashboard_customize_outlined,
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
                    const Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Text(
                        "CAF ()",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ),
                    DropDownLst(
                        lstMethods: weightfactors, onSelect: (String) => {}),
                    IconButton(
                        onPressed: () => {},
                        icon: const Icon(
                          Icons.dashboard_customize_outlined,
                          size: 22,
                        ))
                  ],
                ),
                TextButton(
                    onPressed: () => {},
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

  void validation() {
    for (var item in userInput) {
      if (item.isFill()) {
        setState(() {
          widget.error = true;
          item.changeState();
        });
      }
    }
  }
}
