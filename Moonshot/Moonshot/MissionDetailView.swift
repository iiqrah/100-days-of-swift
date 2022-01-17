//
//  MissionDetailView.swift
//  Moonshot
//
//  Created by iiqrah on 18/01/2022.
//

import SwiftUI

struct MissionDetailView: View {
    
    struct CrewMember{
        let astronaut: Astronaut
        let role: String
    }
    
    let crew: [CrewMember]
    
    let mission: Mission
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    
    var body: some View {
        GeometryReader{ geometry in
            
            ScrollView{
                VStack{
                    
                    Image(mission.imageName)
                    
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    Text("Launch Date: \(mission.formattedLaunchDate)")
                        .font(.title3)
                    
                    
                    VStack (alignment: .leading){
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        
                        Text("Mission Crew: ")
                            .font(.title.bold())
                            .padding(.top, 5)
                        
                        MissionCrewHView(mission: mission, astronauts: astronauts)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
  
                        Text("Mission Highlights: ")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                            .foregroundColor(.secondary)
                        
                        
                        
                    } .padding(.horizontal)
                    
                } .padding(.bottom)
            }
            
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
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

struct MissionDetailView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    
    
    static var previews: some View {
        
        //Forcing one of the mission detail views to show up in dark mode
        MissionDetailView(mission: missions[7], astronauts: astronauts)
            .preferredColorScheme(.dark)
        
    }
}
