// ignore_for_file: file_names

import 'package:budget_calculator/Custom/Heading/Heading1.dart';
import 'package:budget_calculator/Custom/Table/TableRowCard.dart';
import 'package:budget_calculator/Model/UseCaseModel.dart';
import 'package:flutter/material.dart';

class TechnicalFactor extends StatefulWidget {
  final bool typeFacorte;
  const TechnicalFactor({Key? key, required this.typeFacorte})
      : super(key: key);

  @override
  _TechnicalFactorState createState() => _TechnicalFactorState();
}

class _TechnicalFactorState extends State<TechnicalFactor> {
  List<String> description = [];
  String main = "TCF";

  @override
  void initState() {
    // TODO: implement initState
    print(widget.typeFacorte);
    description = widget.typeFacorte ? descriptionFactor : descriptionEFactor;
    main = widget.typeFacorte ? "TCF" : "EF";

    for (var i = 0; i < description.length; i++) {
      input[main]['input'].add(0);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(main);
    return Column(children: getList());
  }

  getList() {
    List<Widget> toReturn = [
      getHeader(),
    ];

    for (var i = 0; i < description.length; i++) {
      toReturn.add(TableRowCard(
        data: [
          description[i],
          "${input[main]["weight"][i]}",
          const [0, 5]
        ],
        onChange: (int value) {
          onChange(i, value);
        },
      ));
    }

    toReturn.add(getTotal());
    toReturn.add(getDivider());
    return toReturn;
  }

  getHeader() {
    return Column(
      children: [
        Heading1(
          heading: main,
          type: false,
        ),
        Row(children: [
          Container(
            decoration: BoxDecoration(border: Border.all()),
            width: MediaQuery.of(context).size.width * .43,
            height: 45,
            alignment: Alignment.centerLeft,
            child: const Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            width: MediaQuery.of(context).size.width * .14,
            height: 45,
            alignment: Alignment.center,
            child: const Text(
              "Weight",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            width: MediaQuery.of(context).size.width * .23,
            height: 45,
            alignment: Alignment.center,
            child: const Text(
              "Rated Value\n(0 - 5)",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ]),
      ],
    );
  }

  onChange(int index, int value) {
    setState(() {
      input[main]['input'][index] = value;
    });
  }

  getTotal() {
    num total = 0;

    for (var i = 0; i < input[main]['input'].length; i++) {
      total += input[main]['input'][i] * input[main]['weight'][i];
    }

    input["UUCP"][main == "TCP" ? "TF" : "EF"] = total.toInt();
    print(total);

    return Container(
      margin: const EdgeInsets.only(top: 5),
      alignment: Alignment.centerRight,
      child: Text("= $total",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }

  getDivider() {
    return const Divider(
      color: Colors.grey,
      thickness: 2,
    );
  }
}
