#!/usr/bin/env python
# fizz-buzz.py a simple fizz-buzz implementation just to kick this repo off

import sys

input_text = input("How much fizz would you like to buzz? ")

try:
    input_number = int(input_text)
except:
    print("This is not an integer.")
    sys.exit(1)

for x in range(1, input_number + 1):
    if (x % 3 == 0) and (x % 5 == 0):
        print("Fizz Buzz!")
    elif (x % 3 == 0):
        print("Fizz!")
    elif (x % 5 == 0):
        print("Buzz!")
    else:
        print(x)