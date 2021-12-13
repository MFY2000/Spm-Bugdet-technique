// ignore_for_file: file_names

import 'package:budget_calculator/Custom/TextFeildCustom.dart';
import 'package:budget_calculator/Model/FunctionalModel.dart';
import 'package:flutter/material.dart';

class UserPoint extends StatefulWidget {
  final List<Functional> input;
  bool isError;
  UserPoint({Key? key, required this.input, required this.isError}) : super(key: key);

  @override
  _UserPointState createState() => _UserPointState();
}

class _UserPointState extends State<UserPoint> {
  late List<Functional> userInput;
  double width = 0.0;

  @override
  void initState() {
    // TODO: implement initState

    userInput = widget.input;
    super.initState();
  }

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
            getTextFildStyle(0),
            getTextFildStyle(1),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getTextFildStyle(2),
            getTextFildStyle(3),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getTextFildStyle(4),
          ],
        )
      ],
    );
  }

  Widget getTextFildStyle(int index) {
    return SizedBox(
      width: width * .35,
      child: TextInputFeild( 
          width_: 0.75,
          input: userInput[index],
          ),
    );
  }
}
