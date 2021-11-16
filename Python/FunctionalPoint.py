

def main(userPoint, weight):
  # Weight Rates
  UAP = 0
  CAP = 0
  F=0
  # Weight Factors
  wtFactors = {
      "Low": [3, 4, 3, 7, 5],
      "Average": [4, 5, 4, 10, 7],
       "High": [6, 7, 6, 15, 10],
  }

  funUnits = {
    "External Inputs": 0,
    "External Outputs": 0,
    "External Inquiries": 0,
    "Internal Logical Files": 0,
    "External Interface Files": 0
  }


  for i in range(5):
    UAP += (wtFactors[i][weight] * userPoint[i])
  


def getInput():
  return int(input("Enter "))


def simpleUAP():
  print("")


def complexUAP():
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
