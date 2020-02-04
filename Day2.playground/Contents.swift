//: Playground - noun: a place where people can play

import UIKit

//Arrays duplicate items where order matters

let harry:String = "Harry Styles"
let liam = "Liam Payne"
let louis = "Louis Tomlinson"
let niall = "Nial Horan"
let zayn = "Zayn Malik"

let oneDirectionArr1:[String] = [harry, liam, louis,niall, zayn]

let heterogeneousArr: Array<Any> = [1,harry,3,4, zayn, 78.98]

//Sets : unique items where order does not matter

let homogeneousSet1 = Set([1, 2])
let homogeneousSet2: Set = [1,2,3,4]

// Is it not possible to have a heterogeneous set?
// What is Hashable protocol?
//let heterogeneousSet: Set<Int> = [1, "Hello"]


//Tuples: fixed in length with identifying names

var tuple = (one: 1, two: 2, greetings: "Hello")
tuple.two
tuple.greetings
tuple.0

//Dictionaries
let phoneBook = [
    "iqrah": "07564061541",
    "sam": "07564061534"
]

phoneBook["james", default: "Unknown"]


//enum

enum Days: Int{
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

let today = Days.Saturday
let tomorrow = Days(rawValue: 2)

// enum association

enum Activity{
    case bored (duration: Int)
    case playing (sport: String)
    case sleeping
}

let personA = Activity.playing(sport: "Badminton")






