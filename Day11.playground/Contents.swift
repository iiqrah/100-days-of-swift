//protocol and protocol-oriented programming


protocol ID {
  var id: String {get set}
  func displayID()
}

//extending protocol
extension ID {
  func displayID(){
    print ("ID for this using Protocol extension: \(id)")
  }

}

//struct data type conforming to ID protocol
struct Animal : ID {

  var id: String
}


//function conforming to ID protocol, not needed if extension already exists
func displayID(thing: ID)
  {
    print("ID for this is \(thing.id)")

  }


var kitten = Animal(id: "7889")
displayID(thing: kitten)
kitten.displayID()


//extention

extension Int{
  func cubed() -> Int {
    return self * self * self
  }
}


extension Double {
    var isNegative: Bool {
        return self < 0
    }
}


var a: Int = 8
print("Cubed int: \(a.cubed())")


var b: Double = 8
print("isNegative: \(b.isNegative)")


