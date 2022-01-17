//
//  ListLayout.swift
//  Moonshot
//
//  Created by iiqrah on 18/01/2022.
//

import SwiftUI

struct ListLayout: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        List{ScrollView{
                ForEach(missions) { mission in
                    
                    NavigationLink{
                        MissionDetailView(mission: mission, astronauts: astronauts)
                    }
                label:{
                    
                    HStack{
                        
                        Image(mission.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack{
                            
                            
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                            
                            
                            
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                        
                    }
                    
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                    
                    
                }
                    
                }
            
        }}
        .listStyle(.plain)
        .listRowBackground(Color.darkBackground)
    }
}

struct ListLayout_Previews: PreviewProvider {
    static var previews: some View {
        ListLayout()
    }
}
