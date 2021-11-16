// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FunctionalPoint extends StatefulWidget {
  const FunctionalPoint({Key? key}) : super(key: key);

  @override
  _FunctionalPointState createState() => _FunctionalPointState();
}

class _FunctionalPointState extends State<FunctionalPoint> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          color: Colors.amberAccent,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(2, (index) {
              return Container(
                width: 40,
                color: Colors.red,
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            }),
          ),
        )
      ],
    ));
  }
}
