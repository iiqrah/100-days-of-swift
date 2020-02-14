/*
              struct                 |  vs |             class
                                     |     |
1. default memberwise initializers   |     | 1. no default memberwise initializers
                                     |     |
2. no inherietence                   |     | 2. have inherietence
                                     |     |
3. no overriding                     |     | 3. have overriding
                                     |     |
4. original and copy point           |     | 4. originnal and copy point
to different location                |     | to same location
                                     |     |
5. no deinitializers                 |     |5. have deinitializers
                                     |     |
6. explicit mutability for constant  |     |6. implicit mutability for constant
instances                            |     |instances
*/

// class, inherietence and overriding
 class Animal {

  var family: String
  var type: String

  init(family: String, type: String){
    self.family = family
    self.type = type
  }

  func makeNoise(){
    print("Ding dind ding ding ding!")
  }
}

// final -> no further inherietence from this class
final class Cat: Animal {

  var name: String
  init(name: String){
    self.name = name
    super.init(family: "Feline", type: "Cat")
  }


   override func makeNoise(){
    print("Meow Meow!")
  }
}

var myAnimal = Animal(family: "dogs", type: "Poodle")
var meow = Cat(name: "zula")

print(myAnimal.type)
meow.makeNoise()

//Copy class instance
var meow2 = meow
print(meow.name) //zula
meow2.name = "katnip"
print(meow.name) //katnip


// deinitializers

class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    deinit {
    print("\(name) is no more!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }

    
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}


