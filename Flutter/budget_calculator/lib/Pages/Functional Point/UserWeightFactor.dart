// ignore_for_file: file_names

import 'package:budget_calculator/Model/FunctionalModel.dart';
import 'package:budget_calculator/Pages/Functional%20Point/CardAdvance.dart';
import 'package:flutter/material.dart';

class UserWeightFactor extends StatefulWidget {
  final int weightfactors;

  const UserWeightFactor({Key? key, required this.weightfactors})
      : super(key: key);

  @override
  _UserWeightFactorState createState() => _UserWeightFactorState();
}

class _UserWeightFactorState extends State<UserWeightFactor> {
  late int noOfchild = 1;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: getDifferentCard());
  }

  getDifferentCard() {
    List<Widget> toReturn = [];
    List<dynamic> weight = [], type = [], limit = [];
    for (var i = 0; i < 5; i++) {
      weight.add([inputControllerFP[i].value]);
      type.add([wtFactors[widget.weightfactors][i]]);
      limit.add(inputControllerFP[i].value);

      toReturn.add(CardAdvance(heading: inputStringFP[i], selection: i));
    }

    if(multipleWeight["weight"].isEmpty) {
      multipleWeight["weight"] = weight;
      multipleWeight["Type"] = type;
      multipleWeight["Limit"] = limit;
    }

    return toReturn;
  }
}
