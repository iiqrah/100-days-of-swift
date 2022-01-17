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
        
        GeometryReader { geometry in
            
            ScrollView{
                
                VStack{
                    
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                    
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .strokeBorder(.white, lineWidth: 1)
                        )
                    
                        .frame(maxWidth: geometry.size.width * 0.9)
                        .padding()
                    
                    
                    
                    
                    
                    VStack (alignment: .leading){
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("About: ")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        
                        Text(astronaut.description)
                            .foregroundColor(.secondary)
                        
                        
                    }.padding(.horizontal)
                         
                    
                }
                .padding(.bottom)
            }
            
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
        
}

struct AstronautDetailView_Previews: PreviewProvider {
    
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        AstronautDetailView(astronaut: astronauts["white"]!)
            .preferredColorScheme(.dark)

    }
}
