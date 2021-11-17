// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DropDownLst extends StatefulWidget {
  final List<String> lstMethods;
  final Function(String value) onSelect;

  const DropDownLst(
      {Key? key, required this.lstMethods, required this.onSelect})
      : super(key: key);

  @override
  _DropDownLstState createState() => _DropDownLstState();
}

class _DropDownLstState extends State<DropDownLst> {
  String dropdownValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     dropdownValue = widget.lstMethods.first;
  }

  @override
  Widget build(BuildContext context) {
  
    return DropdownButton<String>(
      elevation: 8,
      value: dropdownValue,
      icon: const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Icon(Icons.arrow_drop_down),
      ),
      iconSize: 24,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
        widget.onSelect(newValue!);
      },
      items: widget.lstMethods.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(fontWeight: FontWeight.bold),),
        );
      }).toList(),
    );
  }
}
