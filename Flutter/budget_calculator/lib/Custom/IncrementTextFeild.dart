// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NumericStepButton extends StatefulWidget {
  final int minValue;
  final int maxValue;

  final ValueChanged<int> onChanged;

  const NumericStepButton(
      {Key? key,
      this.minValue = 0,
      required this.maxValue,
      required this.onChanged})
      : super(key: key);

  @override
  State<NumericStepButton> createState() {
    return _NumericStepButtonState();
  }
}

class _NumericStepButtonState extends State<NumericStepButton> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.blue,
          child: IconButton(
            icon: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
            iconSize: 10.0,
            onPressed: () {
              onChangeState(counter > widget.minValue, true);
            },
          ),
        ),
        Padding(
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
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.blue,
          child: Center(
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              iconSize: 10.0,
              onPressed: () {
                onChangeState(counter < widget.maxValue, false);
              },
            ),
          ),
        ),
      ],
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
