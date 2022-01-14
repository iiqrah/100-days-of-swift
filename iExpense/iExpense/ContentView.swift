//
//  ContentView.swift
//  iExpense
//
//  Created by iiqrah on 14/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    @State private var isAddItemViewShowing = false
    
    var body: some View {
        NavigationView{
            
            List{
                
                ForEach(expenses.items){ item in
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        
                    }
                    
                
                
                }.onDelete(perform: removeItems)
            }
            .toolbar{
                Button{
                    
                    isAddItemViewShowing = true
                    
                }label:{
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("iExpense")
            
        }.sheet(isPresented: $isAddItemViewShowing){
            AddItemView(expenses: expenses)
        }
    }
    
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
