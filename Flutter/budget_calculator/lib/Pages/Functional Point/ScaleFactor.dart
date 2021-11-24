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
  late Map<String, List<int>> multipleScale = {"weight": [], "Scale": []};
  late int noOfchild = 1;

  @override
  Widget build(BuildContext context) {
    print(multipleScale);
    return Column(
      children: getNoChildren(),
    );
  }

  getNoChildren() {
    List<Widget> toRetun = [];

    for (var i = 0; i < noOfchild; i++) {
      toRetun.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NumericStepButton(
            maxValue: 14,
            minValue: 0,
            onChanged: (index) {
              multipleScale["weight"]![i] = index;
            },
          ),
          DropDownLst(
              lstMethods: widget.weightfactors,
              onSelect: (index) {
                multipleScale["Scale"]![i] =
                    widget.weightfactors.indexOf(index);
              }),
          ElevatedButton(
              onPressed: () {
                if (!(multipleScale["Scale"]![i].isNaN ||
                    multipleScale["weight"]![i].isNaN)) {
                  setState(() {
                    noOfchild++;
                  });
                }
              },
              child: const Text("Add"))
        ],
      ));
    }
    return toRetun;
  }
}
