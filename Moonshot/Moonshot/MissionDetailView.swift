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
    
    var body: some View {
        GeometryReader{ geometry in
            
            ScrollView{
                VStack{
                    
                    Image(mission.imageName)
                    
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    VStack (alignment: .leading){
                        
                
                        Text("Mission Crew: ")
                            .font(.title.bold())
                            .padding(.top, 5)
                        
                        
                        
                        
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
