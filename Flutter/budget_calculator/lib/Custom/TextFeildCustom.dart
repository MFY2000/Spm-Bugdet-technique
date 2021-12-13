// ignore_for_file: file_names, must_be_immutable

import 'package:budget_calculator/Model/FunctionalModel.dart';
import 'package:flutter/material.dart';


class TextInputFeild extends StatefulWidget {
  final double width_;
  final Functional input;


  TextInputFeild({
    Key? key,
    required this.width_,
    required this.input,

  }) : super(key: key);


  @override
  _TextInputFeildState createState() => _TextInputFeildState();
}

class _TextInputFeildState extends State<TextInputFeild> {
  late double width_;
  late TextEditingController taskInput;
  late String inputLabel;
  late void Function(String) onChange;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    width_ = widget.width_; 
    taskInput = widget.input.control; 
    inputLabel = widget.input.display; 
    onChange = widget.input.onChange; 
  }
  
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
          border: const OutlineInputBorder(),
          errorText: widget.input.isValid ? "Please $inputLabel" : null,
          labelText: inputLabel,
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  onChangeInput(String value) {
    
    if (widget.input.isValid) {
      if(value.isNotEmpty){
        setState(() {
          widget.input.isValid = false;   
        });
      }
    }
    onChange(value);
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
      required this.onChange,
      })
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
        if (widget.isValid)
          setState(() {
            widget.isValid = false;
          }),
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
