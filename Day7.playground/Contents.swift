//: Playground - noun: a place where people can play

import UIKit

//closure with a parameter as a funnction parameter
func travel(place: String, action: (String, Int) -> Void) {
    print("I'm getting ready to go.")
    action(place, 4)
    
}

travel (place: "London") { (place, years: Int) in
    print("I'm going to \(place) in my car")
    print("I've lived here \(years) years now.")
}


//return a closure as a return for function

func addition() -> (Int, Int) -> Void {
    return {
        print("Sum is \($0 + $1)")
    }
}

addition()(2,8)


// Capturing values with closure

func counter() -> () -> Void {
    var counter = 0
    return {
        counter+=1
        print("I have been called \(counter) times")
        
    }
}

let test = counter()
test()
test()
