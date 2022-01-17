//
//  MissionDetailView.swift
//  Moonshot
//
//  Created by iiqrah on 18/01/2022.
//

import SwiftUI

struct MissionDetailView: View {
    
    let mission: Mission
    
    var body: some View {
        ScrollView{
            VStack{
                
                Image(mission.imageName)
                
                Text(mission.displayName)
                
                Text(mission.description)
                
            }
        }
    }
}

struct MissionDetailView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    
    static var previews: some View {
        
        //Forcing one of the mission detail views to show up in dark mode
        MissionDetailView(mission: missions[0])
            .preferredColorScheme(.dark)

    }
}
