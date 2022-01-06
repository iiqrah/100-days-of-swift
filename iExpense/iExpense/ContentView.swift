//
//  ContentView.swift
//  iExpense
//
//  Created by iiqrah on 06/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationView{
            
            List{
                
                ForEach(expenses.items){ item in
                    
                    Text(item.name)
                    
                }.onDelete(perform: removeItem)
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button{
                    let expense = ExpenseItem(name: "Test", category: "Personal", cost: 67.98)
                    expenses.items.append(expense)
                }
            label: {
                Image(systemName: "plus")
            }
            }
            
            
        }
    }
    
    func removeItem(at offsets:  IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
