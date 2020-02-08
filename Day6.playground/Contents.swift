// closure syntax

let functionName = {
    print("Function code!")
}

functionName()

//closure with parameter and return

let addition = {(num1: Int, num2: Int) -> Int
    in
    return (num1+num2)
}

print (addition(6,4))


// closure as parameter for a function

let checkAge = {(age: Int) -> Bool in
    return (age >= 18)
}

let driving = {
    print("If you are old enough to vote, you are old enough to learn driving")
}


func VoteMessage(age: Int, check: (Int) -> Bool, action: () -> Void){
    
    if (check(age))
    {
        print("You can vote!")
    }
    else{
        print("You cannot vote!")
    }
    
    action()
    
}

VoteMessage(age: 11, check: checkAge, action: driving)


func testTrailing (_ age: Int, _ name: String, closure: (Int, String) -> Void)
{
    print("Function Message!")
    closure(age, name)
    
}

testTrailing (18, "Iqrah") {
    print("Trailing closure starts")
    print("Name: \($1) age: \($0)")
}
