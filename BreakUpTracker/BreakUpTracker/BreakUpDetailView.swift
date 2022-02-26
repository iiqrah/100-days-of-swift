//
//  BreakUpDetailView.swift
//  BreakUpTracker
//
//  Created by iiqrah on 23/02/2022.
//

import SwiftUI

struct BreakUpDetailView: View {
    
    @ObservedObject var breakups: BreakUps
    var breakup: BreakUp

    var body: some View {
        NavigationView{
            
            VStack{
                
                
                VStack(alignment:.leading){
                    
                    Text("Name: \(breakup.name)")
                        .font(.title)
                    Text("Break-Up Date: \(breakup.date)")
                        .font(.title2)
                    
                    Text("Notes: \n\(breakup.description)")
                        .padding(.top)

    
                }
                
                .padding()
                
                Spacer()



                VStack{
                    
                    Text("Streak: \(breakup.count) \(breakup.count == 1 ? "day" : "days")")
                    
                    Button("+1 Day"){
                        
                        var newBreakup = breakup
                        newBreakup.count += 1
                        
                        if let index = breakups.items.firstIndex(of: breakup) {
                            breakups.items[index] = newBreakup
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                }.font(.title)

                Spacer()
            }

            .padding()
        }

        .preferredColorScheme(.dark)

        
    }
    
}

struct BreakUpDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BreakUpDetailView(breakups: BreakUps(), breakup: BreakUp(name: "XYZ", date: "01/01/2001", description: "Incompatible", count: 0))
    }
}
