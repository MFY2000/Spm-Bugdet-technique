// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CounterButtons extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChanged;
  final int count;

  const CounterButtons(
      {Key? key,
      required this.minValue,
      required this.maxValue,
      required this.onChanged,
      required this.count})
      : super(key: key);

  @override
  State<CounterButtons> createState() {
    return CcounterStateButtons();
  }
}

class CcounterStateButtons extends State<CounterButtons> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.count;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '$counter',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getButton(false),
              getButton(true),
            ],
          )
        ],
      ),
    );
  }

  getButton(bool condtion) {
    bool condition2 =
        condtion ? (counter > widget.minValue) : (counter < widget.maxValue);
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(3),
        color: Colors.grey[350],
        child: Icon(
            condtion ? Icons.remove : Icons.add,
            color: Colors.black,
            size: 13.0,
          )),
        onTap: () {
          onChangeState(condition2, condtion);
        },
      
    );
  }

  onChangeState(bool toChange, bool toGo) {
    if (toChange) {
      setState(() {
        counter = toGo ? counter - 1 : counter + 1;
      });
      widget.onChanged(counter);
    }
  }
}
