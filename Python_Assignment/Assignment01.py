#1. String Concatenation:
def question1():
    str1 = input("Enter your name :")
    str2 = "Hello "
    str3 = ", welcome to Python programming"
    print(str2+str1+str3)
    print()
question1()

#2. String Slicing and Indexing:
def question2():
    str = "Hello Kavin, welcome to Python programming"
    #a. Print the first character of the string.
    print("First character: ",str[:1])
    #b. Print the last character of the string.
    print("Last character: ",str[-1:])
    #c. Print the first 5 characters of the string.
    print("First 5 characters: ",str[:5])
    #d. Print the last 11 characters of the string
    print("Last 11 characters: ",str[-11:])
    #e. Print the string in reverse.
    print("String in reverse: ",str[::-1])
    #f. Use slicing and print the word “Python” from the existing string.
    print("Slicing: ",str[24:30])
    print()
question2()

#3. String Methods:Write a Python program that takes a string, strM = “Python beginner tutorial” and perform the following tasks:
def question3():
        strM = "Python beginner tutorial"
        #a. Convert the sentence to uppercase.
        print("UpperCase: ",strM.upper())           
        #b. Convert the sentence to lowercase.
        print("LowerCase: ",strM.lower())           
        #c. Use Capitalize and return the sentence to the original input form.
        print("Capitalize: ",strM.capitalize())
        print("Original Input: ",strM)
        #d. Count the total number of occurrences of character ‘t’ in the string.
        print("Occurrences of t: ",strM.count("t"))
        #e. Replace all occurrences of “Python” with “Machine Learning” in the input string
        print("Replace: ",strM.replace("Python","Machine Learning"))
        print()
question3()            

#Tuples (Creation, Modification and Access) : Create 1st tuple with values -> (10, 20, 30), 2nd tuple with values -> (40, 50, 60):
def question4():
       t1 = (10,20,30)
       t2 = (40,50,60)
       #a. Concatenate the two tuples and store it in “t_combine”
       t_combine = (t1+t2)
       print("t_combine: ",t_combine) 
       #b. Repeat the elements of “t_combine” 3 times
       times_3 = t_combine *3
       print("times_3: ",times_3) 
       #c. Access the 3rd element from “t_combine”
       print("3rd element:", t_combine[2])
       #d. Access the first three elements from “t_combine”
       print("First three elements:", t_combine[:3])
       #e. Access the last three elements from “t_combine”
       print("Last three elements:", t_combine[-3:])
question4()

