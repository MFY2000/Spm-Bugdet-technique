// ignore_for_file: file_names

import 'package:budget_calculator/Custom/Counter/Counter.dart';
import 'package:budget_calculator/Custom/Heading/Heading1.dart';
import 'package:budget_calculator/Custom/TextFeildCustom.dart';
import 'package:budget_calculator/Model/UseCaseModel.dart';
import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  final String childName;

  const UserInput({Key? key, required this.childName}) : super(key: key);

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  double width = 0.0, height = 0.0;
  String child = "UAW";
  @override
  void initState() {
    // TODO: implement initState
    child = widget.childName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = (MediaQuery.of(context).size.width);
    height = (MediaQuery.of(context).size.height);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Heading1(
          heading: child,
          type: false,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: getTextFeild(),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            ' = ${getAnswer()}',
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 2,
        ),
      ],
    );
  }

  getAnswer() {
    num answer = 0;
    int index = 0;
    String ansToString = "";
    
    List<dynamic> inputValue = input[child]["input"],
        inputwegiht = input[child]["weight"];

    for (var i = 0; i < inputValue.length; i++) {
      answer += inputValue[i] * inputwegiht[i];
      ansToString += "${inputValue[i]} * ${inputwegiht[i]}";
    }

    index = child == "UUCW" ? 1 : 4;
    input["UUCP"][child] = answer;

    defualtStep[index] = "$child = $ansToString";
    defualtStep[++index] = "$child = $answer";

    return answer;
  }

  List<Widget> getTextFeild() {
    List<Widget> toReturnLst = [];
    List<int> temp = [0, 0, 0];
    bool isLimit = false;

    for (int i = 0; i < input[child]["weight"].length; i++) {
      isLimit = input[child]["limit"].length != 0;
      temp[0] = isLimit ? input[child]["limit"][i] : 1000; // Limit (max)
      temp[1] = isLimit && i != 0 ? input[child]["limit"][i - 1] : 0; // min
      temp[2] = input[child]["weight"][i];

      toReturnLst.add(
        SizedBox(
          width: width * .23,
          height: height * .075,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${differentHeading[i]} (${temp[2]})"),
              CounterButtons(
                  count: temp[1],
                  minValue: temp[1],
                  maxValue: temp[0],
                  onChanged: (value) {
                    onChange(value, i);
                  }),
            ],
          ),
        ),
      );
    }

    return toReturnLst;
  }

  onChange(int value, int i) {
    setState(() {
      if ((input[child]["input"].length) < (i + 1)) {
        for (var i = 0; i < 3; i++) {
          input[child]["input"].add(0);
        }
        input[child]["input"][i] = value;
      } else {
        input[child]["input"][i] = value;
      }
    });
  }
}
