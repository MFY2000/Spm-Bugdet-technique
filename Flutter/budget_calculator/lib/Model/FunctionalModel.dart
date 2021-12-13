// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class Functional {
  late int value = 0;
  late String display = "";
  TextEditingController control = TextEditingController();
  bool isValid = false;

  Functional(String value) {
    setDisplay(value);
  }

  Functional.secondMethods(TextEditingController Gcontrol, String value) {
    display = value;
    control = Gcontrol;
  }

  void setDisplay(String value) {
    display = "Enter " + value;
  }

  void changeState() {
    isValid = !isValid;
  }

  bool isFill() {
    return control.value.text.isEmpty;
  }

  int getData() {
    return value;
  }

  onChange(String change) {
    value = int.parse(change);
  }
}


  getLimitLeft() {
    num limit = 14;
    if (multipleScale["weight"].length != 1) {
      for (var i = 1; i < multipleScale["weight"].length; i++) {
        limit -= multipleScale["weight"][i];
      }
    }
    return limit;
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
  [],
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

Map<String, dynamic> multipleScale = {"weight": [14], "Scale": [], "Limit": 14};

Map<String, dynamic> multipleWeight = {"weight": [], "Type": [], "Limit": []};

List<String> defaultsSteps = [
  "F = scale * facotreSelected", // 0
  "F = ", // 1
  "F = ", // 2
  "CAF = 0.65 + (0.01 * factor)", // 3
  "C = 0.65 + (0.01 * ", // 4
  "C = ",  // 5
  "UFP = (UI * EI) + (UO * EO) + (UQ * EQ) + (ELF * ILF) + (UIF * EIF)", // 6
  "UFP = ", // 7
  "UFP = ", // 8
  "FP = CAF * UFP", // 9
  "FP = ", // 10
  "FP = " // 11
];