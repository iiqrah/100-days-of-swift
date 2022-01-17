//
//  MissionCrewHView.swift
//  Moonshot
//
//  Created by iiqrah on 18/01/2022.
//

import SwiftUI

struct MissionCrewHView: View {
    
    struct CrewMember{
        let astronaut: Astronaut
        let role: String
    }
    
    let crew: [CrewMember]
    
    let mission: Mission
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                
                ForEach(crew, id: \.role){ member in
                    
                    NavigationLink{
                        
                        AstronautDetailView(astronaut: member.astronaut)
                        
                        
                    }
                label:{
                    
                    HStack{
                        
                        Image(member.astronaut.id)
                            .resizable()
                            .frame(width: 104, height: 72)
                            .clipShape(Capsule())
                            .overlay(
                                Capsule()
                                    .strokeBorder(.white, lineWidth: 1)
                            )
                        
                        
                        
                        VStack (alignment: .leading){
                            Text(member.astronaut.name)
                                .foregroundColor(.white)
                                .font(.headline)
                            Text(member.role)
                                .foregroundColor((member.role == "Commander" || member.role == "Command Pilot") ? .red : .secondary)
                            
                        }
                    }
                }
            }
        }
    }
    }
    
    
    init(mission: Mission, astronauts: [String: Astronaut] ){
        
        self.mission = mission
        self.crew = mission.crew.map { member in
            
            if let astronaut = astronauts[member.name] {
                return CrewMember(astronaut: astronaut, role: member.role)
            }
            
            else{
                fatalError("\(member.name) not found")
            }
            
        }
        
    }
    
}

struct MissionCrewHView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    
    static var previews: some View {
        MissionCrewHView(mission : missions[7], astronauts: astronauts)
    }
}
