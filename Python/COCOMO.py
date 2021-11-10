
import os

def COCOMO():
  os.system("cls")
  LOC = int(input("Enter the value of LOC: "))

  if(LOC <= 50):
    print("Organic")

    print(f"Person-months = 2.4({LOC})^1.05")
    PM1 = 2.4 * (pow(LOC,1.05))
    print(F"Person-months = {PM1}")

    print(f"Development-time = 2.5({PM1})^.38")
    DT1 = 2.5 * (pow(PM1,0.38))
    print(f"Development-time = {DT1}")

  elif(LOC <= 300):

    print("Semidetached")
    print(f"Person-months = 3.0({LOC})^1.12")
    PM2 = 3.0 * (pow(LOC,1.12))
    print(F"Person-months = {PM2}")

    print(f"Development-time = 2.5({PM2})^.35")
    DT2 = 2.5 * (pow(PM2,0.35))
    print(f"Development-time = {DT2}")

  else:
    print("Embedded")

    print(f"Person-months = 3.6({LOC})^1.20")
    PM3 = 3.6 * (pow(LOC,1.20))
    print(F"Person-months = {PM3}")

    print(f"Development-time = 2.5({PM3})^.32")
    DT3 = 2.5 * (pow(PM3,0.32))
    print(f"Development-time = {DT3}")
