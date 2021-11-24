// ignore_for_file: file_names

import 'package:budget_calculator/Custom/DropDown.dart';
import 'package:budget_calculator/Custom/IncrementTextFeild.dart';
import 'package:budget_calculator/Model/FunctionalModel.dart';
import 'package:flutter/material.dart';

class ScaleFactor extends StatefulWidget {
  final List<String> weightfactors;
  final int limit;

  const ScaleFactor(
      {Key? key, required this.weightfactors, required this.limit})
      : super(key: key);

  @override
  _ScaleFactorState createState() => _ScaleFactorState();
}

class _ScaleFactorState extends State<ScaleFactor> {
  late int noOfchild = 1;
  late int limitLeft;

  @override
  void initState() {
    // TODO: implement initState

    limitLeft = widget.limit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("$limitLeft > $multipleScale");
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
            maxValue: limitLeft,
            minValue: 0,
            onChanged: (index) {
              multipleScale["weight"]![i] = index;
              setState(() {
                limitLeft = calculateScaleLeft(multipleScale["weight"]!);
              });
            },
          ),
          DropDownLst(
              lstMethods: widget.weightfactors,
              onSelect: (index) {
                multipleScale["Scale"]![i] =
                    widget.weightfactors.indexOf(index);
              }),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    if (limitLeft != 0) {
                      if (!(multipleScale["Scale"]![i] == 0 &&
                          multipleScale["weight"]![i] == 0)) {
                        setState(() {
                          multipleScale["Scale"]!.add(0);
                          multipleScale["weight"]!.add(0);

                          limitLeft =
                              calculateScaleLeft(multipleScale["weight"]!);
                          noOfchild++;
                        });
                      }
                    }
                  },
                  icon: const Icon(Icons.add)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      toRetun.removeAt(i);
                      multipleScale["Scale"]!.removeAt(i);
                      multipleScale["weight"]!.removeAt(i);
                      limitLeft = calculateScaleLeft(multipleScale["weight"]!);
                      noOfchild--;
                    });
                  },
                  icon: const Icon(Icons.delete)),
            ],
          )
        ],
      ));
    }
    return toRetun;
  }

  int calculateScaleLeft(List<int> lst) {
    int sum = 0;
    for (var item in lst) {
      sum += item;
    }

    return 14 - sum;
  }
}
