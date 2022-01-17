//
//  AstronautDetailView.swift
//  Moonshot
//
//  Created by iiqrah on 18/01/2022.
//

import SwiftUI

struct AstronautDetailView: View {
    
    
    let astronaut: Astronaut
    
    var body: some View {
        
        VStack{
            
            Image(astronaut.id)

            
            Text(astronaut.name)
            
            Text(astronaut.description)
            
            
        }
        
    }
}

struct AstronautDetailView_Previews: PreviewProvider {
    
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        AstronautDetailView(astronaut: astronauts["white"]!)
            .preferredColorScheme(.dark)

    }
}
