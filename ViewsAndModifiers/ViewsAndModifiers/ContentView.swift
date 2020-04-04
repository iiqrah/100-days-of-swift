//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Iqrah Nadeem on 11/03/2020.
//  Copyright © 2020 Iqrah Nadeem. All rights reserved.
//

// SwiftUI uses structs instead of class, better performaces, simpler and functional design

import SwiftUI


struct ContentView: View {

    var body: some View {
        
 
           Text("Hello World")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
