//
//  AddBreakUpView.swift
//  BreakUpTracker
//
//  Created by iiqrah on 23/02/2022.
//

import SwiftUI

struct AddBreakUpView: View {
    
    @ObservedObject var breakups: BreakUps
    
    @Environment(\.dismiss) var dismiss

    
    @State private var name = ""
    @State private var date = ""
    @State private var description = ""
    @State private var count = 0
    
    var body: some View {
        
        NavigationView{
            
            Form{
                TextField("Broken-up with: ", text: $name)
                TextField("Break-Up Date: ", text: $date)
                TextField("Notes: ", text: $description)
                
                Stepper("No contact streak: \(count) \(count == 1 ? "day" : "days")", value: $count, in: 0...30)
                
            }
            
            .navigationTitle("Add New Break-Up")
            
            .toolbar {
                Button {
                    let item = BreakUp(name: name, date: date, description: description, count: count)
                    breakups.items.append(item)
                    dismiss()
                } label: {
                    Text("Save 💔")
                        .foregroundColor(.gray)

                }
            }

        }
        
        .preferredColorScheme(.dark)

        
        
    }
}

//struct AddBreakUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddBreakUpView(breakups: BreakUps)
//    }
//}
