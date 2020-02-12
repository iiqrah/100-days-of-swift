// memberwise initializer

struct User1 {
    var username: String

    init() {
        username = "anonymous"
    }
}

struct User2 {
    var username: String = "anonymous"
}

var iiqrah = User1()
print(iiqrah.username)
iiqrah.username = "iiqrah"
print(iiqrah.username)


// struct with self and lazy property

struct Species{

  var family: String

  init(family: String){
    self.family = family
  }

}

// static annd private struct property

struct Cat {

  static var catCount: Int = 0
  private var catID: Int


  var colour: String


  lazy var catSpecies = Species(family: "feline")

  init(catID: Int, colour: String){
    Cat.catCount+=1
    self.catID = catID
    self.colour = colour
  }


  func accessCatID() -> String{
    return "Cat ID: \(catID)"
  }

}

var kitty = Cat(catID: 123, colour: "yellow")
print(kitty) //try print with and w/o lazy
var kitty2 = Cat(catID: 456, colour: "blue")

print(Cat.catCount)

print(kitty.accessCatID())
