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
    
    @State private var isShowingGrid = true


    
    var body: some View {
        NavigationView{
               
            ScrollView{
                
                
                if isShowingGrid {
                        //GridLayout(astronauts: astronauts, missions: missions)
                    Text("Showing Grid")
                    } else {
                        //ListLayout(astronauts: astronauts, missions: missions)
                        Text("Showing List")
                    }
                
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
            
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            
            .toolbar{
                Button("Press Me"){
                    
                    isShowingGrid.toggle()
                    
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
