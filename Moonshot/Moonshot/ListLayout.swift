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
        List{
            ForEach(missions) { mission in
                
                NavigationLink{
                    MissionDetailView(mission: mission, astronauts: astronauts)
                }
            label:{
                HStack {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding()
                    VStack (alignment: .leading){
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(mission.formattedLaunchDate)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    Spacer()
                }
            }
            }
            
            .listStyle(.plain)
            .listRowBackground(Color.darkBackground)
        }
        
        .preferredColorScheme(.dark)
        
    }
}

struct ListLayout_Previews: PreviewProvider {
    static var previews: some View {
        ListLayout()
    }
}
