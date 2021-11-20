// ignore_for_file: file_names

import 'package:budget_calculator/Pages/UseCasePoint/UserInput.dart';
import 'package:flutter/material.dart';

class UseCasePoint extends StatefulWidget {
  const UseCasePoint({Key? key}) : super(key: key);

  @override
  _UseCasePointState createState() => _UseCasePointState();
}

class _UseCasePointState extends State<UseCasePoint> {

  late String toReturn;
  late double UUCW;
  late double UAW;


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
                      'Use Case Point',
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'UUCW',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                  UserInput(
                    lstWeight: [5, 10, 15],
                    noOfChild: 3,
                    onchange: onChange
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'UUCW',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                  UserInput(
                    lstWeight: [1, 2, 3],
                    noOfChild: 3,
                    onchange: onChange
                  ),
                ])));
  }
  onChange(String toReturn, int index, double answer){
    toReturn = toReturn;
    if(index == 0) {
      UUCW = answer;
    }else{
      UAW = answer;
    }

  }
}
