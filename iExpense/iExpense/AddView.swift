//
//  AddView.swift
//  iExpense
//
//  Created by iiqrah on 07/01/2022.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name  = ""
    @State private var category  = "Personal"
    @State private var cost  = 0.0
    
    let categories = ["Personal", "Business"]
    
    var body: some View {
        NavigationView{
            
            Form{
                
                TextField("Item Name: ", text: $name)
                
                Picker("Item Category", selection: $category){
                    ForEach(categories, id: \.self){
                        Text($0)
                    }
                    
                }
                
                
                TextField("Item Cost: ", value: $cost, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
                


                
            }.navigationTitle("Add Item")
                .toolbar{
                    Button("Save"){
                        
                        let item = ExpenseItem(name: name, category: category, cost: cost)
                        expenses.items.append(item)
                        dismiss()
                        
                    }
                }
            
            
            
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
