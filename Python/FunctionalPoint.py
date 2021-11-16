

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

  # funUnits = [
  #   getInput("External Inputs"),
  #   getInput("External Outputs"),
  #   getInput("External Inquiries"),
  #   getInput("Internal Logical Files"),
  #   getInput("External Interface Files"),
  # ]

  funUnits = [55, 35, 10, 7 , 8]

    # // 14 factors
    # string aspects[14] = {
    #     "reliable backup and recovery required ?",
    #     "data communication required ?",
    #     "are there distributed processing functions ?",
    #     "is performance critical ?",
    #     "will the system run in an existing heavily utilized operational environment ?",
    #     "on line data entry required ?",
    #     "does the on line data entry require the input transaction to be built over multiple screens or operations ?",
    #     "are the master files updated on line ?",
    #     "is the inputs, outputs, files or inquiries complex ?",
    #     "is the internal processing complex ?",
    #     "is the code designed to be reusable ?",
    #     "are the conversion and installation included in the design ?",
    #     "is the system designed for multiple installations in different organizations ?",
    #     "is the application designed to facilitate change and ease of use by the user ?"
    # };


  for i in range(5):
    UAP += (wtFactors[i][weight] * userPoint[i])
  


def getInput(inputDetails):
  return int(input(f"Enter {inputDetails}"))


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
