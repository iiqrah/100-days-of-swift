//
//  AddItemView.swift
//  iExpense
//
//  Created by iiqrah on 15/01/2022.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment (\.dismiss) var dismiss
    
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    
    @State private var type = "Personal"
    let types = ["Personal", "Business"]
    
    @State private var amount = 0.0
    
    
    var body: some View {
        NavigationView{
            
            Form{
                TextField("Item Name: ", text: $name)
                
                Picker("Type: ", selection: $type){
                    ForEach(types, id:\.self){
                        Text($0)
                    }
                }
                
                TextField("Amount: ", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
                
            }.navigationTitle("Add Item")
            .toolbar{
                    Button("Save"){
                        let expense = ExpenseItem(name: name, type: type, amount: amount)
                        
                        expenses.items.append(expense)
                        
                        dismiss()
                    }
                }
            
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(expenses: Expenses())
    }
}
