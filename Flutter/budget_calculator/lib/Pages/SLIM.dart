// ignore_for_file: file_names, prefer_const_constructors

import 'package:budget_calculator/Custom/Contain.dart';
import 'package:budget_calculator/Custom/TextFeildCustom.dart';
import 'package:flutter/material.dart';

class SLIMCalculator extends StatefulWidget {
  const SLIMCalculator({Key? key}) : super(key: key);

  @override
  _SLIMCalculatorState createState() => _SLIMCalculatorState();
}

class _SLIMCalculatorState extends State<SLIMCalculator> {
  TextEditingController inputTextLOC = TextEditingController();
  TextEditingController inputTextC = TextEditingController();
  TextEditingController inputTextT = TextEditingController();

  String ResultToString = "";
  var Result;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 40),
          alignment: Alignment.centerLeft,
          child: const Text(
            'SLIM',
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
        ),
        TextFeildCustom(
          width_: 0.75,
          taskInput: inputTextLOC,
          inputLabel: "Enter the value of LOC", isValid: false,onChange: (String ) {  },
        ),
        TextFeildCustom(
          width_: 0.75,
          taskInput: inputTextC,
          inputLabel: "Enter the value of C (610 to 57314)", isValid: false,onChange: (String ) {  },
        ),
        TextFeildCustom(
          width_: 0.75,
          taskInput: inputTextT,
          inputLabel: "Enter the value of t", isValid: false,onChange: (String ) {  },
        ),
        TextButton(
            onPressed: () => {calculateSlim()},
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .0125),
              width: MediaQuery.of(context).size.width * .75,
              height: MediaQuery.of(context).size.height * .05,
              alignment: Alignment.center,
              child: Text(
                "Calculate",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
            )),
        ResultToString.isNotEmpty ? getResult() : Container(),
      ],
    );
  }

  getResult() {
    return Contain(resultToString: ResultToString);
  }

  calculateSlim() {
    setState(() {
      ResultToString += "K = ( ${getTextFromFeild(inputTextLOC)} / ( ${getTextFromFeild(inputTextC)} * (${getTextFromFeild(inputTextT)}(4/3)) )) * 3";
      ResultToString += "\n";
      Result = (getTextFromFeild(inputTextT) * (4 / 3));

      ResultToString += "K = ( ${getTextFromFeild(inputTextLOC)} / ( ${getTextFromFeild(inputTextC)} * (${Result}) )) * 3";
      ResultToString += "\n";

      Result = (Result * getTextFromFeild(inputTextC));

      ResultToString += "K = ( ${getTextFromFeild(inputTextLOC)} / (${Result})) * 3";
      ResultToString += "\n";

      Result = (getTextFromFeild(inputTextLOC) / Result);

      ResultToString += ("K = (${Result}) * 3");
      ResultToString += "\n";
      Result = (Result * 3);

      ResultToString += ("K = ${Result}");

    });
  }

  num getTextFromFeild(var feild) {
    return num.parse(feild.value.text);
  }
}
