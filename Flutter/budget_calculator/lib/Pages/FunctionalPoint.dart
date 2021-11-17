// ignore_for_file: file_names

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
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 40),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Functional Point',
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
        ),
        


      ],
    ));
  }
}
