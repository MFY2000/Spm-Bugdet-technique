// ignore_for_file: file_names

import 'package:budget_calculator/Custom/DropDown.dart';
import 'package:budget_calculator/Custom/PopupAlert.dart';
import 'package:budget_calculator/Model/FunctionalModel.dart';
import 'package:flutter/material.dart';

class CardAdvance extends StatefulWidget {
  final String heading;
  final int selection;

  const CardAdvance({
    Key? key,
    required this.heading,
    required this.selection,
  }) : super(key: key);

  @override
  _CardAdvanceState createState() => _CardAdvanceState();
}

class _CardAdvanceState extends State<CardAdvance> {
  late String heading;
  late int userValue, children = 0, currentIndex = 0, limit = 0;

  late List<dynamic> weight = [], type = [];

  late List<Functional> control = [];

  late bool isSave = false;

  @override
  void initState() {
    // TODO: implement initState

    print(multipleWeight);
    weight = multipleWeight["weight"][widget.selection];
    type = multipleWeight["Type"][widget.selection];
    limit = multipleWeight["Limit"][widget.selection];

    children = weight.length;
    currentIndex = children - 1;

    heading = widget.heading;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide())),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$heading ($limit)",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
              SizedBox(
                width: 120,
                child: Text(
                  getDetails(),
                ),
              ),
            ],
          ),
          Column(children: getChildren()),
          Container(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
                child: const Text("Add"), onPressed: onAddingChildren),
          ),
        ],
      ),
    );
  }

  getDetails() {
    String details = "";
    int temp = type[0];
    for (var i = 0; i < weight.length; i++) {
      if (weight[i] != 0) {
        temp = type[i] == 0 ? type[0] : type[i];
        details +=
            "${i == 0 ? "All" : weight[i]} are ${weightfactors[temp]} ${i == 0 ? "except" : ','} ";
      }
    }
    return details;
  }

  getChildren() {
    List<Widget> toReturn = [];
    int count = 0;
    if (children != 1) {
      for (var i = 1; i < children; i++, count++) {
        control.add(Functional("weight"));
        toReturn.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.only(bottom: 17),
                width: MediaQuery.of(context).size.width * .125,
                child: TextField(
                  enabled: (currentIndex == i),
                  decoration: InputDecoration(
                      hintText: "Enter",

                      errorText: control[count].isValid ? " Error " : null),
                  controller: control[count].control,
                  onChanged: (String value) {
                    onChange(value, count);
                  },
                )),
            DropDownLst(
              lstMethods: weightfactors,
              onSelect: (String value) {
                onSelect(value, count);
              },
            ),
            buttonToDisplay(i)
          ],
        ));
      }
    }

    return toReturn;
  }

  onAddingChildren() {
    if (canAddChildren()) {
      setState(() {
        weight.add(0);
        type.add(0);

        children = weight.length;
        currentIndex = children - 1;

        multipleWeight["weight"][widget.selection] = weight;
        multipleWeight["Type"][widget.selection] = type;
      });
    }
  }

  bool canAddChildren() {
    bool toReturn = false;

    if (weight.last == 0 || type.last == 0) {
      popupAlert(context, "Fill the feild", "Pls Fill the feild to add more");
    } else {
      if (weight.length == 1) {
        toReturn = true;
      } else if (isWeightDivided()) {
        toReturn = true;
      }
    }
    return toReturn;
  }

  bool isWeightDivided() {
    num sum = 0;
    for (var i = 1; i < weight.length; i++) {
      sum += weight[i];
    }
    return !(sum == limit);
  }

  onChange(String value, int index) {
    bool isError = false;
    
    int temp = weight[index];
    int typing = int.parse(value);

    if (limitLeft() >= typing) {
      weight[index] = typing;
      isError = false;
    } else {
      control[index].control.text = "$temp";
      weight[index] = temp;
      isError = true;
    }

    print("$isError");
    setState(() {
      control[index].isValid = isError;
    });
    print("$weight");

  }

  onSelect(String value, int index) {
    if (index == currentIndex) {
      for (var i = 0; i < weightfactors.length; i++) {
        if (weightfactors[i] == value) {
          type[currentIndex] = i;
        }
      }
    }
  }

  buttonToDisplay(int i) {
    bool match = (i == currentIndex);

    return Row(
      children: [
        IconButton(
            onPressed: () => {match ? onEdit(i) : onDelete(i)},
            icon: Icon(
              match ? Icons.edit : Icons.delete,
              color: match ? Colors.green : Colors.red,
            )),
        IconButton(
            onPressed: () => {onDelete(i)},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ],
    );
  }

  onDelete(int index) {
    setState(() {
      weight.removeAt(index);
      type.removeAt(index);

      children = weight.length;
      currentIndex = children - 1;

      multipleWeight["weight"][widget.selection] = weight;
      multipleWeight["Type"][widget.selection] = type;
    });
  }

  onEdit(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  limitLeft() {
    num limitLeft = limit;
    for (var i = 1; i < weight.length; i++) {
      limitLeft -= weight[i];
    }
    return limitLeft;
  }
}
