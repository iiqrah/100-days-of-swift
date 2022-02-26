//
//  ContentView.swift
//  BreakUpTracker
//
//  Created by iiqrah on 23/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var breakups = BreakUps()
    
    @State private var showingAddBreakUpView = false

    
    var body: some View {
        NavigationView{
            List{
                ForEach(breakups.items) { item in
                    
                    NavigationLink{
                        BreakUpDetailView(breakups: breakups, breakup: item)
                    } label: {
                        
                        HStack{
                            
                            Text("💔")
                            
                            HStack {
                                   VStack(alignment: .leading) {
                                       Text(item.name)
                                           .font(.headline)
                                       Text(item.date)
                                   }

                                   Spacer()
                                Text("\(item.count) \(item.count == 1 ? "day" : "days") streak")
                               }
                            
                        }
                    }
                }.onDelete(perform: removeItems)

            }
            .navigationTitle("Break-Up Tracker")
            .preferredColorScheme(.dark)

            
            .toolbar {
                Button {
                    showingAddBreakUpView = true
                } label: {
                    Text("Add Another 💔")
                        .foregroundColor(.gray)

                }
            }
            
        }.sheet(isPresented: $showingAddBreakUpView) {
            AddBreakUpView(breakups: breakups)
        
    }
    
    
    
}
    
    func removeItems(at offsets: IndexSet) {
        breakups.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
