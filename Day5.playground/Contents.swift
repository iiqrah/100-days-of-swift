//: Playground - noun: a place where people can play

import UIKit

//function with parameters
/*
 func printMessage(_ daysLeft: Int, to event: String) {
 
 let message = """
 I'm going to \(event) in \(daysLeft) days, scary but exciting!
 """
 print(message)
 
 }
 
 printMessage( 14, to: "VidCon")


// return functionc

func addition(num1: Int, num2: Int) -> Int {
    return (num1+num2)
}

let result = addition(num1: 4, num2: 6)
print(result)
 


// throwing exceptions in functions

//create enum for your exceptions
//use throw with appropriate error scenarioes
//use do, try and catch to execute code with error handling

enum passwordError: Error {
    case obvious
    case allNumeric
    case allAlphabetic
    case tooShort(passwordLength: Int)
}

func checkPassword(_ password: String) throws -> Bool{
    
    if password == "password"
    {
        throw passwordError.obvious
    }
    
    return true
    
}

do{
    try
        checkPassword("password")
        print ("Passed")
}

catch passwordError.obvious{
    print("too easy!")
}

catch passwordError.allNumeric{
    print("all numbers")
}
*/

//inout parameter
func doubleInt (number: inout Int){
    number*=2
}

var number = 4
print(number)
doubleInt(number: &number)
print(number)
