//
//  ContentView.swift
//  Edutainment
//
//  Created by iiqrah on 02/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isGameScreenShown = false
    @State private var isSettingsScreenShown = false

    
    @State private var tablesSelected = 2
    
    var questionCountOptions = [5, 10, 15, 20]
    @State private var questionCountSelected = 5
    @State private var questionCount = 1

    
    
    var body: some View {
        
        NavigationView{
            
            if isGameScreenShown {
                
                VStack{
                    
                    
                    
                    Text("\(questionCount) / \(questionCountSelected)")
                    
                    
                    Button("Next question"){
                        nextQuestion()
                    }
                    
                    
                    Button("Game Settings"){
                        gameSettings()
                    }
                    
                    
                }
                
                
                    .navigationTitle("Let's Play")
                
            }
            
            else {
                
                VStack{
                    
                    Spacer()
                    
                    Section {
                        Stepper("Which multiplication table?", value: $tablesSelected, in: 2...12)
                        Text("Tables selected \(tablesSelected)")
                        
                    }
                    
                    Spacer()
                    
                    Section {
                        
                        HStack{
                            Text("How many questions?")
                            Picker("How many questions?", selection: $questionCountSelected) {
                                ForEach(questionCountOptions, id: \.self) {
                                    Text("\($0)")
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                        }
                        //Text("Number of questions selected \(questionCountSelected)")
                        
                    }
                    
                    Spacer()
                    
                    Button("Start Game"){
                        startGame()
                    }
                    
                    Spacer()
                
                
            }
                .padding(.all)
                .navigationTitle("Game Settings")
           
            }
            
        }
        
        
        
        
    }
    
    
    func startGame(){
        isGameScreenShown = true
        
    }
    
    
    
    func nextQuestion() {
        
        if (questionCountSelected < questionCountSelected) {
            questionCount += 1
        }
        
        else{
            newGame()
        }
        
    }
    
    func newGame(){
        
        
    }
    
    func gameSettings(){
        isSettingsScreenShown = true
        isGameScreenShown = false
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
