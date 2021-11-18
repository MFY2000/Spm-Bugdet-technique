// ignore_for_file: file_names

import 'package:flutter/material.dart';

class UseCasePoint extends StatefulWidget {
  const UseCasePoint({Key? key}) : super(key: key);

  @override
  _UseCasePointState createState() => _UseCasePointState();
}

class _UseCasePointState extends State<UseCasePoint> {
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
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'UUCW',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal),
                    ),
                  ),
                ])));
  }
}
