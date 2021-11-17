// ignore_for_file: file_names

import 'package:budget_calculator/Custom/TextFeildCustom.dart';
import 'package:flutter/material.dart';

class FunctionalPoint extends StatefulWidget {
  const FunctionalPoint({Key? key}) : super(key: key);

  @override
  _FunctionalPointState createState() => _FunctionalPointState();
}

class _FunctionalPointState extends State<FunctionalPoint> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Functional Point',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: TextFeildCustom(
                        width_: 0.75,
                        taskInput: TextEditingController(),
                        inputLabel: "Enter User Input",
                      ),
                    ),
                    Container(
                      width: 150,
                      child: TextFormField(
                          decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your username',
                      )),
                    ),
                  ],
                )
              ],
            )));
  }
}
