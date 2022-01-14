//
//  ExpenseItem.swift
//  iExpense
//
//  Created by iiqrah on 14/01/2022.
//

import Foundation

struct ExpenseItem : Identifiable, Codable{
    
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
