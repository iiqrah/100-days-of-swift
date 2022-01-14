//
//  ContentView.swift
//  iExpense
//
//  Created by iiqrah on 14/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationView{
            
            List{
                
                ForEach(expenses.items, id:\.name){ item in
                    Text(item.name)
                }
            }
            .toolbar{
                Button{
                    
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 0.0)
                    
                    expenses.items.append(expense)
                    
                }label:{
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("iExpense")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
