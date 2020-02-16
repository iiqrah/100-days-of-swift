// optional
var age: Int? = nil
print(age)


//unwrapping using if let
var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}


//unwrapping using gaurd let

func greeting(name: String?){

  guard let unwrapped = name else {
    print("Oops, no name")
    return
  }

  print ("Hello, \(unwrapped)")

}

greeting(name: "iiqrah")


// force unwrapping

var str = "7"
var num1 = Int(str)!

print(num1+8)

//optional optionals (implicit optionals)
var num2 : Int!

//nil coalescing
func displayUser(_ name: String) -> String? {
  if (name == "Iqrah"){
    return "Username: iiqrah"
  }

  else {
    return nil
  }

}

print(displayUser("Nadeem") ?? "Anonymous")


//optional chaining
var names = [String]()
var member1 = names.first?.uppercased()
print(member1)

//failable initializers
struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

//typecasting

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]
print (pets)

for pet in pets{
  if let dog = pet as? Dog{
    dog.makeNoise()
  }
}
