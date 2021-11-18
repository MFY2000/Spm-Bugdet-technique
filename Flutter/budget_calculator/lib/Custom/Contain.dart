// ignore_for_file: file_names


import 'package:flutter/material.dart';


class Contain extends StatelessWidget {
  final String resultToString;

  const Contain({ Key? key, required this.resultToString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border:
                Border.all(color: const Color.fromARGB(255, 51, 204, 255), width: 1),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
          child: Text(
            resultToString,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Positioned(
            left: 50,
            top: 12,
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              color: Colors.white,
              child: const Text(
                'Solution',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            )),
      ],
    );
  }
}