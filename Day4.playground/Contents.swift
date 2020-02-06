//: Playground - noun: a place where people can play
/*
//for loop

for value in [1,2,3]{
    print(value)
}

for _ in 1...5{
    print("hello")
}


//while loop : condition checked first
var i = 10
while i > 5{
    print(i)
    i-=1
}

//repeat loop : condition checked later, code runn at least once
i = 2
repeat {
    print(i)
    i-=1
} while i>5


// break, continue, outer break

outerLoop: for i in 0...9{
    for j in 0...9{
        print ("\(i) * \(j) is \(i*j)")
        
        if i*j == 50 {
            break outerLoop
        }
    }
}
*/

for _ in 0...3 {
    print("Hip hip hurray!")
}

let count = 1...3
for _ in count {
    print("There's no place like home.")
}

var counter = 2
while counter < 64 {
    print("\(counter) is a power of 2.")
    counter *= 2
}


