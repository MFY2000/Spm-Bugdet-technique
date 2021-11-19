// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class Functional {
  String display;
  late TextEditingController control = TextEditingController();
  bool isValid;

  Functional({required this.display, required this.isValid});

  changeState() {
    isValid = !isValid;
  }

  bool isFill() {
    return control.value.text.isEmpty;
  }

  int getData(){
    return int.parse(control.value.text);
  }
}

List<Functional> inputControllerFP = [
  Functional(display: "Enter User Input", isValid: false),
  Functional(display: "Enter User Output", isValid: false),
  Functional(display: "Enter User Inquiries", isValid: false),
  Functional(display: "Enter User Files", isValid: false),
  Functional(display: "Enter External Interface", isValid: false),
];

List<List<int>> wtFactors = [
  [6, 7, 6, 15, 10],
  [4, 5, 4, 10, 7],
  [3, 4, 3, 7, 5],
];
