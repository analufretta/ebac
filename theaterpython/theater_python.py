##Theater Python Program --> Program to purchase tickets from the montthly programm

#libraries
import datetime
import os

#variables
performances = ["Lost in repetition", "The poetics of surviving"] #range of performances

base = datetime.date.today()
numdays = int(3)
date_list = [(base + datetime.timedelta(days=agenda)).strftime("%d %B, %Y") for agenda in range(numdays)] #range of dates

ticket = 35.50 #ticket price

os.system("clear")

name = input("Type your name to start the program: ")

os.system("clear")

print("Hello, {0}, welcome to Theater Python!\n".format(name))

#Performance selection loop_1
while True:
  print("Which performance would you would like to purchase?\n")
  for lineup in range(len(performances)): #loop to print the whole varible performances
    print("{0}. {1}".format(lineup + 1, performances[lineup])) #Formating
  else:
    perf_question = int(input("\nType the option number you would like to purchase: "))

  if perf_question > len(performances) or perf_question < 1:
    print ("\nInvalid option. Try again.")
    input("Press any key to continue...")
    os.system("clear")
    continue
  else:
      print("\nYou chose to buy tickets for '{0}'".format(performances[perf_question-1]))
      input("Press any key to continue...")
      os.system("clear")

#Date selection loop_2
  while True:
    print("When do you want to see '{0}'?\n".format(performances[perf_question-1]))
    for lineup_dates in range(len(date_list)): #loop to print the whole varible performances
      print("{0}. {1}".format(lineup_dates + 1, date_list[lineup_dates])) #Formating
    else:
      date_question = int(input("\nType the option number you would like to purchase: "))

    if date_question > len(date_list) or date_question < 1:
      print ("\nInvalid option. Try again.")
      input("Press any key to continue...")
      os.system("clear")
      continue #come back to beginning loop_2
    else:
      os.system("clear")
      print("\nYou chose to buy tickets for '{0}' on '{1}'\n".format(performances[perf_question-1], date_list[date_question-1]))

#Tickets loop_3
    while True:
      qtd = int(input("How many tickets would you like to purchase? ")) #quantity of tickets
      if qtd > 5 or qtd < 1:
         print("\nInvalid number. You can buy between 1 and 5 tickets. Try again.")
         input("Press any key to continue...")
         os.system("clear")
         print("You chose to buy tickets for '{0}' on '{1}'\n".format(performances[perf_question-1], date_list[date_question-1]))
         continue
      else:
        print("\nThe total price is €", (qtd * ticket))
        break #Finish loop_3
    break #finish loop_2
  break #Finish loop_1

