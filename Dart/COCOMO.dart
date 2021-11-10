import 'dart:io';
import 'dart:math';

void COCOMO() {
  print('Enter KLOC:');
  int kloc = int.parse(stdin.readLineSync() ?? "00");

  if (kloc <= 50 && kloc >= 2) {
    var effort1 = 2.4 * pow(kloc, 1.05);
    print('organic effort is: $effort1 person / month');

    var dT1 = 2.5 * pow(effort1, 0.38);
    print(' dev. time is : $dT1');
  }

  /// semi detached
  else if (kloc > 50 && kloc <= 300) {
    var effort2 = 3 * pow(kloc, 1.12);
    print('semi effort is: $effort2 person / month');

    var dT2 = 2.5 * pow(effort2, 0.35);
    print('semi dev. time is : $dT2');
  } else if(kloc > 300) {
    var effort3 = 3.6 * pow(kloc, 1.20);
    print('embedded effort is: $effort3 person / month');

    var dT3 = 2.5 * pow(effort3, 0.32);
    print('embedded dev. time is : $dT3');
  }
  else{
    print("Ps enter the KLOc");
  }
}
