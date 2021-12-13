// ignore_for_file: file_names

import 'package:budget_calculator/Custom/DropDown.dart';
import 'package:budget_calculator/Custom/IncrementTextFeild.dart';
import 'package:budget_calculator/Model/FunctionalModel.dart';
import 'package:flutter/material.dart';

class ScaleFactor extends StatefulWidget {
  const ScaleFactor({Key? key}) : super(key: key);

  @override
  _ScaleFactorState createState() => _ScaleFactorState();
}

class _ScaleFactorState extends State<ScaleFactor> {
  late int noOfchild = multipleScale["weight"].length;
  late int limitLeft;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                  getValues(multipleScale["weight"], multipleScale["Scale"]),
                  style: getStyle(),
                )),
            IconButton(onPressed: onAddChild, icon: const Icon(Icons.add)),
          ],
        ),
        Column(
          children: getNoChildren(),
        )
      ],
    );
  }


  onAddChild() {
    if (getLimitLeft() != 0) {
      if (!(multipleScale["Scale"].last == 0 &&
          multipleScale["weight"].last == 0)) {
        setState(() {
          multipleScale["Scale"].add(0);
          multipleScale["weight"].add(0);
          noOfchild++;
        });
      }
    }
  }

  getNoChildren() {
    List<Widget> toRetun = [];

    for (var i = 1; i < noOfchild; i++) {
      toRetun.add(
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NumericStepButton(
            maxValue: (multipleScale["weight"]![i] + getLimitLeft()),
            minValue: 0,
            onChanged: (index) {
              multipleScale["weight"]![i] = index;
              setState(() {
                limitLeft = getLimitLeft();
              });
            },
          ),
          DropDownLst(
              lstMethods: weightScale,//getLst(multipleScale["Scale"][i]),
              onSelect: (index) {
                setState(() {
                  multipleScale["Scale"][i] = weightScale.indexOf(index);
                });
              }),
              
          IconButton(
              onPressed: () {
                setState(() {
                  // toRetun.removeAt(i);
                  multipleScale["Scale"]!.removeAt(i);
                  multipleScale["weight"]!.removeAt(i);
                  limitLeft = getLimitLeft();
                  noOfchild--;
                }); 
              },
              icon: const Icon(Icons.delete)),
        ],
      ));
    }
    return toRetun;
  }

  TextStyle getStyle() {
    return const TextStyle(
        color: Colors.black, fontWeight: FontWeight.w900);
  }
  String getValues(
    List<dynamic> weight,
    List<dynamic> scale,
  ) {
    String toReturn = "";
    String temp = "";
    int value;

    for (var i = 0; i < weight.length; i++) {
      value = scale[i] == 0 ? scale[0] : scale[i];
      temp = weightScale[value];

      if (weight[i] != 0) {
        toReturn +=
            "${i == 0 ? "All" : weight[i]} are ${temp.substring(0, 3)} (${--value}) ${i == 0 ? "except" : ","} ";
      }
    }

    return toReturn;
  }
}
