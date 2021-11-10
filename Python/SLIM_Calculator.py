import os

def SlIM():

  os.system("cls")
  print("The mathematical formula used is: \n")
  print("K = ( LOC / ( C * t4/3 )) * 3")          
  print("\n\nK is the total life cycle effort in working years, t is the")
  print("development and the C is the technology constant, merging the outcome")
  print("of using tools, languages, methodology, and quality assurance ( QA ) time in")
  print("years.")
  print("The value of technology constant differs from 610 to 57314. For relaxed,")
  print("qualified project technology constant is high.")
  print("\nData:")
    
  LOC = int(input("Enter the LOC: "))
  C = int(input("Enter the C (610 to 57314): "))
  t = float(input("Enter the value t: "))
  print("\nSolution:")


  print(f"K = ( {LOC} / ( {C} * ({t}(4/3)) )) * 3")
  k = t * (4/3)
  print(f"K = ( {LOC} / ( {C} * ({k}) )) * 3")
  k = k * C
  print(f"K = ( {LOC} / ({k})) * 3")
  k = LOC / k
  print(f"K = ({k}) * 3")
  k = k * 3
  print(f"K = {k}")
