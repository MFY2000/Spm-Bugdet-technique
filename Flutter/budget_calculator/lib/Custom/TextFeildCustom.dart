// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class TextFeildCustom extends StatelessWidget {
  final double width_;
  final TextEditingController taskInput;
  final String inputLabel;
  bool isValid = false;
  final void Function(String) onChange;

  TextFeildCustom({
    Key? key,
    required this.width_,
    required this.taskInput,
    required this.inputLabel,
    required this.isValid,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .025),
      width: (MediaQuery.of(context).size.width) * width_,
      child: TextField(
        controller: taskInput,
        keyboardType: TextInputType.number,
        onChanged: onChangeInput,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          errorText: isValid ? "Please ${inputLabel}" : null,
          labelText: inputLabel,
        ),
      ),
    );
  }

  onChangeInput(String value){
    onChange(value);

    if (isValid){
     isValid = value.isEmpty;
    }
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
