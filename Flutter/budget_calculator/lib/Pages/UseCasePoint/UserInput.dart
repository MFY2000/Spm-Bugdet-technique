// ignore_for_file: file_names

import 'package:budget_calculator/Model/UseCaseModel.dart';
import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  final int noOfChild;
  final List<int> lstWeight;
  const UserInput({Key? key, required this.noOfChild, required this.lstWeight})
      : super(key: key);

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    width = (MediaQuery.of(context).size.width);

    return Column(
      children: [
        Row(
          children: [],
        ),
      ],
    );
  }

  List<Widget> getTextFeild() {
    List<Widget> toReturnLst = [];

    for (int i = 0; i < widget.noOfChild; i++) {
      toReturnLst.add(SizedBox(
        width: width * .40,
        child: TextInput(
            taskInput: inputControllerUCP[i].control,
            inputLabel: inputControllerUCP[i].display,
            isValid: inputControllerUCP[i].isValid,
            onChange: onchangeValue,
            index: i),
      ));
    }

    return toReturnLst;
  }

  void onchangeValue(int value) {
    
  }
}

class TextInput extends StatefulWidget {
  final TextEditingController taskInput;
  bool isValid;
  final String inputLabel;
  final void Function(int value) onChange;
  final int index;

  TextInput(
      {Key? key,
      required this.isValid,
      required this.inputLabel,
      required this.taskInput,
      required this.index,
      required this.onChange})
      : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.taskInput,
      keyboardType: TextInputType.number,
      onChanged: (value) => {
        if(widget.isValid)
          widget.isValid = false,

        widget.onChange(widget.index)
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        errorText: widget.isValid ? "Please ${widget.inputLabel}" : null,
        labelText: widget.inputLabel,
      ),
    );
  }
}
