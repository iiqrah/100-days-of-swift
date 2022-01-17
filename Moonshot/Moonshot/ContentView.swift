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
                    GridLayout()
                    } else {
                        //ListLayout(astronauts: astronauts, missions: missions)
                        Text("Showing List")
                    }
                
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
