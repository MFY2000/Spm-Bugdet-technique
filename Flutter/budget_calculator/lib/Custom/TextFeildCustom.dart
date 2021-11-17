// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextFeildCustom extends StatelessWidget {
  final double width_;
  final TextEditingController taskInput;
  final String inputLabel;
  late bool isValid = false;

  TextFeildCustom(
      {Key? key,
      required this.width_,
      required this.taskInput,
      required this.inputLabel,
      required this.isValid,
      })
      : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .025),
      width: (MediaQuery.of(context).size.width) * width_,
      child: TextField(
        controller: taskInput,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          errorText: isValid ? "Please ${inputLabel}": null,
          labelText: inputLabel,
        ),
      ),
    );
  }
}
