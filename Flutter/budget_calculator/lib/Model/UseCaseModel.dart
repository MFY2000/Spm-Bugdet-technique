
// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class UseCaseModel{
  String display;
  late TextEditingController control = TextEditingController();
  late bool isValid = false;

  UseCaseModel({required this.display});

}


List<UseCaseModel> inputControllerUCP = [
  UseCaseModel(display: "Simple"),
  UseCaseModel(display: "Average"),
  UseCaseModel(display: "complex"),
];

