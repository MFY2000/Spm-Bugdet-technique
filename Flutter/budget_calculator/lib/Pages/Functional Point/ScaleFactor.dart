// ignore_for_file: file_names

import 'package:budget_calculator/Custom/DropDown.dart';
import 'package:budget_calculator/Custom/IncrementTextFeild.dart';
import 'package:flutter/material.dart';

class ScaleFactor extends StatefulWidget {
  final List<String> weightfactors;

  const ScaleFactor({Key? key, required this.weightfactors}) : super(key: key);

  @override
  _ScaleFactorState createState() => _ScaleFactorState();
}

class _ScaleFactorState extends State<ScaleFactor> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NumericStepButton(
          maxValue: 14,
          minValue: 0,
          onChanged: (index) {
            print(index);
          },
        ),
        DropDownLst(
            lstMethods: widget.weightfactors,
            onSelect: (index) {
              print(index);
            }),
        ElevatedButton(onPressed: () {print("add new");}, child: const Text("Add"))
      ],
    );
  }
}
