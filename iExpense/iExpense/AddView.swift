//
//  AddView.swift
//  iExpense
//
//  Created by iiqrah on 07/01/2022.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    
    @State private var name  = ""
    @State private var category  = "Personal"
    @State private var cost  = 0.0
    
    let categories = ["Personal", "Business"]
    
    var body: some View {
        NavigationView{
            
            Form{
                
                TextField("Item Name: ", text: $name)
                
                
                TextField("Item Category: ", text: $category)
                
                Picker("Item Category", selection: $category){
                    ForEach(categories, id: \.self){
                        Text($0)
                    }
                    
                }
                
                
                TextField("Item Cost: ", value: $cost, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)


                
            }
            
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
