// ignore_for_file: file_names

import 'package:budget_calculator/Custom/DropDown.dart';
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
  late int userValue, children = 0, currentIndex = 0;

  late List<dynamic> weight = [], type = [];

  late bool canAddChildren = true;

  @override
  void initState() {
    // TODO: implement initState

    weight = multipleWeight["weight"][widget.selection];
    type = multipleWeight["Type"][widget.selection];
    children = weight.length - 1;

    heading = widget.heading;
    userValue = weight.first;
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
                "$heading ($userValue)",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
              Text(
                "${getTotal()}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: getChildren(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                child: const Text("Add"),
                onPressed: () => {
                  if (canAddChildren)
                    {
                      setState(() {
                        children++;
                        canAddChildren = false;
                      })
                    }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  getTotal() {
    num sum = 0;
    for (var i = 0; i < weight.length; i++) {
      sum += (weight[i] * type[i]);
    }
    return sum;
  }

  getChildren() {
    List<TextEditingController> control = [];
    List<Widget> toReturn = [];

    for (var i = 0; i < children; i++) {
      control.add(TextEditingController());

      toReturn.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.only(bottom: 17),
              width: MediaQuery.of(context).size.width * .125,
              child: TextField(
                controller: control[i],
              )),
          DropDownLst(lstMethods: weightfactors, onSelect: (index) {}),
          Row(
            children: [
              IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () => {
                        setState(() {
                          children--;
                          canAddChildren = true;
                        })
                      },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
        ],
      ));
    }
    return toReturn;
  }
}
