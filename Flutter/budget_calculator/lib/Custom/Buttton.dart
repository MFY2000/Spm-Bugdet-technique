// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final void Function() calculate;
  CalculateButton({Key? key, required this.calculate}) : super(key: key);

  late double widht, height;
  @override
  Widget build(BuildContext context) {
    widht = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return TextButton(
        onPressed: calculate,
        child: Container(
          margin: EdgeInsets.only(top: height * .0125),
          width: widht * .75,
          height: height * .05,
          alignment: Alignment.center,
          child: const Text(
            "Calculate",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: const BorderRadius.all(Radius.circular(15.0))),
        ));
  }
}
