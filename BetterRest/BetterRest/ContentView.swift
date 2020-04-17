//
//  ContentView.swift
//  BetterRest
//
//  Created by Iqrah Nadeem on 17/04/2020.
//  Copyright © 2020 Iqrah Nadeem. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value = 5
    @State private var date = Date()
    
    var body: some View {
        
        VStack{
            
            Stepper(value: $value, in: 1 ... 10)
            {
                Text("\(value)")
            }
            
            
            DatePicker("Label for date picker", selection: $date, in: Date()..., displayedComponents: .date)
            .labelsHidden()
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
