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
        GeometryReader{ geometry in
            
            ScrollView{
                VStack{
                    
                    Image(mission.imageName)
                    
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    VStack (alignment: .leading){
                        
                        Text("\(mission.displayName) Highlights: ")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        
                    } .padding(.horizontal)
                    
                    
                    
                    
                }.padding(.bottom)
            }
            
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
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
