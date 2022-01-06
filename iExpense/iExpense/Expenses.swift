//
//  Expenses.swift
//  iExpense
//
//  Created by iiqrah on 06/01/2022.
//

import Foundation

class Expenses : ObservableObject {
    @Published var items = [ExpenseItem]()
}
