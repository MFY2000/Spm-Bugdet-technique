

def main(weight):
  # Weight Rates
  UFP = 0
  CAP = 0
  F=0
  # Weight Factors
  wtFactors = {
      "Low": [3, 4, 3, 7, 5],
      "Average": [4, 5, 4, 10, 7],
      "High": [6, 7, 6, 15, 10],
  }

  userPoint = [55, 35, 10, 7 , 8]
  weight = 1

  # userPoint = [
  #   getInput("External Inputs"),
  #   getInput("External Outputs"),
  #   getInput("External Inquiries"),
  #   getInput("Internal Logical Files"),
  #   getInput("External Interface Files"),
  # ]


  fac_rate = [3]
  scale = [14]

  for i in range(len(fac_rate)):
    F += factors(fac_rate[i], scale[i])
  
  CAF = getCAF(F)
  UCP =  simpleUFP(wtFactors, userPoint, weight)
  
  FP = CAP * UCP


  print("Function Point Analysis :-" )
  print("Unadjusted Function Points (UFP) : ", UFP )
  print("Complexity Adjustment Factor (CAF) : ", CAF )
  print("Function Points (FP) : ", FP )


  
def getCAF(F):
  return (0.65 + (0.01 * F))

def factors(fac_rate, count):
  return (fac_rate * count)

def simpleUFP(wtFactors, userPoint, weight):
  UFP = 0
  for i in range(5):
    UFP += (wtFactors[i][weight] * userPoint[i])
  
  return UFP

def getInput(inputDetails):
  return int(input(f"Enter {inputDetails}"))


    



def complexUFP():
  print("")


if __name__ == '__main__':
  main()


# Rate Scale of Factors
# Rate the following aspects on a scale of 0-5 :-
# 0 - No influence 
# 1 - Incidental 
# 2 - Moderate 
# 3 - Average 
# 4 - Significant 
# 5 - Essential 
