import 'package:budget_calculator/Custom/Heading/Heading1.dart';
import 'package:flutter/material.dart';

class CardSolution extends StatelessWidget {
  final String heading;
  final String data;
  const CardSolution({
    Key? key,
    required this.heading,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var values = data.replaceAll(",", '\n');
    values = values.replaceAll("[", '');
    values = values.replaceAll("]", '');

    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin:  const EdgeInsets.only(bottom: 20),
      child: Column(children: [
        Heading1(
          heading: "$heading: ",
          type: false,
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 30, right: 10),
          child: Text(
            values,
            style: TextStyle(fontSize: 14, color: Colors.black),
            textAlign: TextAlign.left,
          ),
        )
      ]),
    );
  }
}
