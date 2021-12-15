// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class UseCaseModel {
  String display;
  late TextEditingController control = TextEditingController();
  late bool isValid = false;

  UseCaseModel({required this.display});
}

List<String> differentHeading = ["Simple", "Average", "complex"];

Map<String, dynamic> input = {
  "UUCP": {"UUCW": 0, "UAW": 0},
  "UUCW": {
    "input": [0,3,7],
    "weight": [5, 10, 15],
    "limit": [3, 7, 100]
  },
  "UAW": {
    "input": [],
    "weight": [1, 2, 3],
    "limit": []
  },
  "TCF": {
    "input": [],
    "weight": [2.0, 1.0, 1.0, 1.0, 1.0, .5, .5, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0],
    "Limit": []
  },
  "EF": {
    "input": [],
    "weight": [1.5, .5, 1.0, .5, 1.0, 2.0, -1.0, -1.0],
    "Limit": []
  }
};

List<String> descriptionFactor = [
  "Distributed System",
  "Response time/throughput performance",
  "End user efficiency",
  "Complex internal processing",
  "Code must be reusable",
  "Easy to instal",
  "Easy to us",
  "Portable",
  "Easy to change",
  "Concurrent",
  "Includes special security objectives",
  "Provides direct access for third parties (decrease the value)",
  "Special user training facilities are required (decrease the value)",
];

List<String> descriptionEFactor = [
  "Familiar with the project model that is used",
  "Application experience",
  "Object-oriented experience",
  "Lead analyst capability",
  "Motivation",
  "Stable requirements",
  "Part-time staff",
  "Difficult programming language"
];

List<String> defualtStep = [
  "UUCP = UUCW + UAW",
  "UUCW = (5 * NSUC) + (10 * NAUC) + (15 * NCUC)",
  "UAW = 1 * NSA + 2 * NAA + 3 * NCA",
  "TFactor(Impact) = W * RV",
  "TCF = 0.6 + (0.01 * TFactor)",
  "1.4 + (-0.03 * EFactor)"
  "UCP = UUCP * TCF * EF",
  "UCP = ",
  "UCP = ",
];

