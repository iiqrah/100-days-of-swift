//
//  Expenses.swift
//  iExpense
//
//  Created by iiqrah on 14/01/2022.
//

import Foundation

class Expenses: ObservableObject{
    
    @Published var items = [ExpenseItem]()
}
