// ignore_for_file: file_names

import 'package:budget_calculator/Custom/TextFeildCustom.dart';
import 'package:budget_calculator/Model/FunctionalModel.dart';
import 'package:flutter/material.dart';

class UserPoint extends StatefulWidget {
  const UserPoint({Key? key}) : super(key: key);

  @override
  _UserPointState createState() => _UserPointState();
}

class _UserPointState extends State<UserPoint> {
  var userInput = inputControllerFP;
  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    width = (MediaQuery.of(context).size.width);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * .40,
              child: TextFeildCustom(
                width_: 0.75,
                taskInput: userInput[0].control,
                inputLabel: userInput[0].display,
                isValid: userInput[0].isValid,
              ),
            ),
            SizedBox(
              width: width * .40,
              child: TextFeildCustom(
                width_: 0.75,
                taskInput: userInput[1].control,
                inputLabel: userInput[1].display,
                isValid: userInput[1].isValid,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * .40,
              child: TextFeildCustom(
                width_: 0.75,
                taskInput: userInput[2].control,
                inputLabel: userInput[2].display,
                isValid: userInput[2].isValid,
              ),
            ),
            SizedBox(
              width: width * .40,
              child: TextFeildCustom(
                width_: 0.75,
                taskInput: userInput[3].control,
                inputLabel: userInput[3].display,
                isValid: userInput[3].isValid,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * .40,
              child: TextFeildCustom(
                width_: 0.75,
                taskInput: userInput[4].control,
                inputLabel: userInput[4].display,
                isValid: userInput[4].isValid,
              ),
            ),
          ],
        )
      ],
    );
  }
}
