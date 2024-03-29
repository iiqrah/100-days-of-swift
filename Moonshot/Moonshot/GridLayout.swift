//
//  GridLayout.swift
//  Moonshot
//
//  Created by iiqrah on 18/01/2022.
//

import SwiftUI

struct GridLayout: View {

    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        
        ScrollView{
        LazyVGrid(columns: columns){
            
            ForEach(missions) { mission in
                
                NavigationLink{
                    MissionDetailView(mission: mission, astronauts: astronauts)
                }
            label:{
                
                VStack{
                    
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
            
            
            
        }
        .padding([.horizontal, .bottom])
        }
        
        
        
        
    }
}

struct GridLayout_Previews: PreviewProvider {
    static var previews: some View {
        GridLayout()
    }
}
