

import os
from SLIM_Calculator import SlIM
from COCOMO import COCOMO


def main():
  os.system("cls")
  print("Software Project Management")

  technique = ["SlIM", "COCOMO"]


  for i in range(len(technique)):
    print(f"\t{i}\t=>\t{technique[i]}\t")

  print("\tx\t=>\tExist\t")

  choiceInput = input("Press: ")


  if(choiceInput == "x" or choiceInput == "X"):
    return 1
  elif(choiceInput == "0"):
    SlIM()
  elif(choiceInput == "1"):
    COCOMO()

  return 0


if __name__ == '__main__':
  next = 0
  while (next != 1):
    next = main()
