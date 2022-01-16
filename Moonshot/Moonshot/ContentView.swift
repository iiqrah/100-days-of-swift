//
//  ContentView.swift
//  Moonshot
//
//  Created by iiqrah on 16/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    //astronauts.json is a dictionary
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    //missions.json is an array
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    //To define an adaptive column layout
    let columns = [GridItem(.adaptive(minimum: 150))]


    
    var body: some View {
        NavigationView{
            
            ScrollView{
                LazyVGrid(columns: columns){
                    
                    ForEach(missions) { mission in
                        
                        NavigationLink{
                            Text("Mission Detail")
                        }
                    label:{
                        
                        VStack{
                            
                            Image(mission.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            
                            Text(mission.displayName)
                                .font(.headline)
                            Text(mission.launchDate ?? "N/A")
                                .font(.caption)
                            
                            
                            
                            
                        }
                        .frame(maxWidth: .infinity)
                        
                    }
                        
                    }
                    
                    
                }
            }.navigationTitle("Moonshot")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
