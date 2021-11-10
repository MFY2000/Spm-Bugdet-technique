import 'dart:io';

void SlIM() {
  
print("The mathematical formula used is: \n");
print("K = ( LOC / ( C * t4/3 )) * 3");   
print("\n\nK is the total life cycle effort in working years, t is the");
print("development and the C is the technology constant, merging the outcome");
print("of using tools, languages, methodology, and quality assurance ( QA ) time in");
print("years.");
print("The value of technology constant differs from 610 to 57314. For relaxed,");
print("qualified project technology constant is high.");
print("\nData:");


print("Enter the value of LOC: \b");
int LOC = int.parse(stdin.readLineSync() ?? "0");

print("Enter the value of C (610 to 57314): \b");
int C = int.parse(stdin.readLineSync() ?? "610");

print("Enter the value of t: \b");
double t = double.parse(stdin.readLineSync() ?? "00");

print("\nSolution:");

print("K = ( ${LOC} / ( ${C} * (${t}(4/3)) )) * 3");
var k = (t * (4/3));
print("K = ( ${LOC} / ( ${C} * (${k}) )) * 3");
k = (k * C);
print("K = ( ${LOC} / (${k})) * 3");
k = (LOC / k);
print("K = (${k}) * 3");
k = (k * 3);
print("K = ${k}");


}