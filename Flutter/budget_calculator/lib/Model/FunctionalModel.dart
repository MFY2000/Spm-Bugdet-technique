// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class Functional {
  int value = 0;
  String display = "Enter";
  TextEditingController control = TextEditingController();
  bool isValid = false;

  Functional(String value) {
    setDisplay(value);
    control.text = "${this.value}";
  }

  void setDisplay(String value) {
    display = "Enter" + value;
  }

  void changeState() {
    isValid = !isValid;
  }

  bool isFill() {
    return control.value.text.isEmpty;
  }

  int getData() {
    value = int.parse(control.value.text);
    return value;
  }

  onChange(String change){
    value = int.parse(change);
  }
}

List<String> inputStringFP = [
  "User Input",
  "User Output",
  "User Inquiries",
  "User Files",
  "External Interface"
];

List<Functional> inputControllerFP = [];

List<List<int>> wtFactors = [
  [6, 7, 6, 15, 10],
  [4, 5, 4, 10, 7],
  [3, 4, 3, 7, 5],
];

List<String> weightfactors = ["....", "High", "Average ", "Low"];
List<String> weightScale = [
  "....",
  "No influence",
  "Incidental",
  "Moderate",
  "Average",
  "Significant",
  "Essential"
];

Map<String, List<int>> multipleScale = {
  "weight": [0],
  "Scale": [0]
};

Map<String, List<int>> multipleWeight = {
  "weight": [0],
  "Type": [0],
  "Limit": [0]
};
