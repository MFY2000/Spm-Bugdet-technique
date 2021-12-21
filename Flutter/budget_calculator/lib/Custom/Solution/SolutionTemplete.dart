// ignore_for_file: file_names

import 'package:budget_calculator/Custom/Solution/CardSolution.dart';
import 'package:flutter/material.dart';

class SolutionTemplete extends StatelessWidget {
  final Map<String, List<int>> headings;
  final List<String> data;
  const SolutionTemplete({
    Key? key,
    required this.headings,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 51, 204, 255), width: 1),
        borderRadius: BorderRadius.circular(5),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        children: getChildren(),
      ),
    );
  }

  getChildren() {
    List<Widget> toReturn = [];

    headings.forEach((key, value) {
      toReturn.add(CardSolution(
        heading: key,
        data: (data.sublist(value[0], value[1]).toString()),
      ));
    });

    for (var i = 0; i < headings.length; i++) {}
    return toReturn;
  }
}
