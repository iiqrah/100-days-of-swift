//: Playground - noun: a place where people can play

import UIKit

//Arithmetic Operators + - / * %

//Operator Overloading

print(2+4)
print("Hello"+"World")
print([1,2,3]+[4,5,6])

//Compound Assignment Operator += -= *=

//conditions
let age = 2

if age > 18 {
    print("You can buy knives in the UK!")
}
else{
    print("You cannot buy knives in the UK!")
}

//combining conditions && ||

//ternary operator

print ( age > 16 ? "You can apply for provisional licence":"You cannot apply for provisional licence")

//switch statements

switch (age){
    case 0..<18:
        print("You are a child.")
    case 18...90:
        print("You are eligible to vote!")
    fallthrough
    default:
        print(String(age) + " is you age!")
}
