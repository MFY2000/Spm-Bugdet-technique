// ignore_for_file: file_names

import 'dart:ffi';

import 'package:budget_calculator/Custom/Counter/Counter.dart';
import 'package:flutter/material.dart';

class TableRowCard extends StatelessWidget {
  final List<dynamic> data;
  final onChange;
  const TableRowCard({Key? key, required this.data, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all()),
          width: MediaQuery.of(context).size.width * .43,
          height: 45,
          alignment: Alignment.centerLeft,
          child: Text(data[0]),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all()),
          width: MediaQuery.of(context).size.width * .14,
          height: 45,
          alignment: Alignment.center,
          child: Text(data[1], style: TextStyle(fontWeight: FontWeight.w900),),
        ),
        Container(
          // decoration: BoxDecoration(border: Border.all()),
          width: MediaQuery.of(context).size.width * .23,
          height: 45,
          alignment: Alignment.center,
          child: CounterButtons(
            count: data[2][0],
            maxValue: data[2][1],
            minValue: data[2][0],
            onChanged: onChange,
          ),
        ),
      ],
    );
  }
}
