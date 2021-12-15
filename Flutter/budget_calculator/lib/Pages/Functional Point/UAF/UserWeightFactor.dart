// ignore_for_file: file_names

import 'package:budget_calculator/Model/FunctionalModel.dart';
import 'package:budget_calculator/Pages/Functional%20Point/UAF/CardAdvance.dart';
import 'package:flutter/material.dart';

class UserWeightFactor extends StatefulWidget {
  const UserWeightFactor({Key? key}) : super(key: key);

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

    List<dynamic> weight = [], limit = [];

    for (var i = 0; i < 5; i++) {
      weight.add([inputControllerFP[i].value]);
      limit.add(inputControllerFP[i].value);
      toReturn.add(CardAdvance(heading: inputStringFP[i], selection: i));
    }

    if (multipleWeight["Limit"] != limit) {
      multipleWeight["weight"] = weight;
      multipleWeight["Limit"] = limit;
    }else{
      updateList(limit);
    }

    return toReturn;
  }

  updateList(var limit){
    for (var i = 0; i < multipleWeight["Limit"].length; i++) {
      if(multipleWeight["Limit"][i] != limit[i]){
        multipleWeight["Limit"][i] = limit[i];
        multipleWeight["weight"][i][0] = limit[i];
      }
    }
  }
}
