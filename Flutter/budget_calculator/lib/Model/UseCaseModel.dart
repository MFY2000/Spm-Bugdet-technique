
// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class UseCaseModel{
  String display;
  late TextEditingController control = TextEditingController();
  late bool isValid = false;

  UseCaseModel({required this.display});

}


List<String> inputControllerUCP = ["Simple",  "Average",  "complex"];

