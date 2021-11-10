import 'dart:io';

import 'COCOMO.dart';
import 'SLIM.dart';

void main() {
  int next;
  do {
    next = Calcaltor();
  } while (next != 1);
}

int Calcaltor() {
  print("Software Project Management");

  List<String> technique = ["SlIM", "COCOMO"];

  for (int i = 0; i < technique.length; i++) {
    print("\t${i}\t|${technique[i]}\t");
  }

  print("\tx\t=>\tExist\t");

  print("Press: ");
  String choiceInput = stdin.readLineSync() ?? "";

  if (choiceInput == "x" || choiceInput == "X")
    return (1);
  else if (choiceInput == "0")
    SlIM();
  else if (choiceInput == "1") COCOMO();

  return 0;
}
