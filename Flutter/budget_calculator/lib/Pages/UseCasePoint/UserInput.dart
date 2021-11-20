// ignore_for_file: file_names

import 'package:budget_calculator/Model/UseCaseModel.dart';
import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  final int noOfChild;
  final List<int> lstWeight;
  final int index;
  final Function(String toReturn, int index, double answer) onchange;
  
  UserInput({Key? key, required this.noOfChild, required this.lstWeight, required this.onchange, required this.index})
      : super(key: key);

  late List<int> userValueEnter = [0, 0, 0];

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  double width = 0.0;
  double answer = 0.0;
  late List<UseCaseModel> lstInput = [];

  @override
  Widget build(BuildContext context) {
    width = (MediaQuery.of(context).size.width);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: getTextFeild(),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            ' = ${getAnswer()}',
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
      ],
    );
  }

  double getAnswer(){
    double answer = 0;
    String toReturn = "";
    String temp= "";
    for (var i = 0; i < widget.noOfChild; i++) {
      temp = i < (widget.noOfChild - 1) ? "+": "";
      toReturn += "(${widget.lstWeight[i]} * ${widget.userValueEnter[i]}) $temp";
      answer += widget.lstWeight[i] * widget.userValueEnter[i]; 
    }

    toReturn += "\n";
    widget.onchange(toReturn, widget.index, answer);
    return answer;
  }

  List<Widget> getTextFeild() {
    List<Widget> toReturnLst = [];

    for (int i = 0; i < widget.noOfChild; i++) {
      lstInput.add(UseCaseModel(display: inputControllerUCP[i]));

      toReturnLst.add(SizedBox(
        width: width * .25,
        child: TextInput(
            taskInput: lstInput[i].control,
            inputLabel: lstInput[i].display,
            isValid: lstInput[i].isValid,
            onChange: onchangeValue,
            index: i),
      ));
    }

    return toReturnLst;
  }

  void onchangeValue(int index, String value) {
    setState(() {
      widget.userValueEnter[index] = int.parse(value);
    });
  }
}

class TextInput extends StatefulWidget {
  final TextEditingController taskInput;
  bool isValid;
  final String inputLabel;
  final void Function(int index, String value) onChange;
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
        if (widget.isValid) widget.isValid = false,
        widget.onChange(widget.index, value)
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        errorText: widget.isValid ? "Please ${widget.inputLabel}" : null,
        labelText: widget.inputLabel,
      ),
    );
  }
}
