// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Heading1 extends StatelessWidget {
  final String heading;
  final bool type;
  const Heading1({Key? key, required this.heading, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.centerLeft,
      child: Text(
        heading,
        style: TextStyle(
          color: type ? Colors.teal : Colors.black54,
          fontSize: type ? 21 : 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
