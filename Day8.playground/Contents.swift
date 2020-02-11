//: Playground - noun: a place where people can play



//structs with stored and computed properties
struct Book {
    
    var name: String
    var author: String
    var isAvailable: Bool
    
    var availabilityMessage: String {
        
        if (isAvailable){
            return ("\(name) is availble to be borrowed.")
        }
            
        else{
            return ("\(name) is not availble to be borrowed.")
            
        }
    }
}

var book1 = Book(name:"The Brain", author: "David Eagleman", isAvailable: false)

print(book1.availabilityMessage)

// struct with property observer
struct MealTracker {
    
    var mealName: String{
        didSet{
            print ("Just had \(mealName)")
        }
    }
    
}

var meal1 = MealTracker(mealName: "")

meal1.mealName = "Eggs and Bread"
meal1.mealName = "Pasta"
meal1.mealName = "Salmon"


//struct with methods (functions) inc. mutating methods
struct Car{
    var carName: String
    var carPrice: Double
    
    func carInsurance() -> Double {
        return (carPrice*0.83)
    }
    
    mutating func makeAnon() {
        carName = "Annonymous"
    }
    
}

var myCar = Car(carName: "Toyota", carPrice: 34_080)
print(myCar.carInsurance())
print(myCar.carName)
myCar.makeAnon()
print(myCar.carName)


//struct String methods and properties
var testString : String = "Hello Hackers!"
print(testString.lowercased())
print(testString.count)

//struct Array methods and properties

var testArray = ["hello", "hacker"]
testArray.append("yellow")
print(testArray)
print(testArray.count)
print(testArray.isEmpty)

