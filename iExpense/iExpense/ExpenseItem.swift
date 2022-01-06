//
//  ExpenseItem.swift
//  iExpense
//
//  Created by iiqrah on 06/01/2022.
//

import Foundation

//Add Identifiable protocol to remove it from ContentView file as SwiftUI now knows how to uniquiely identify each entity
struct ExpenseItem  : Identifiable, Codable{
    var id = UUID() //Generates a unique hex-decimal id
    let name: String
    let category: String
    let cost: Double
}
