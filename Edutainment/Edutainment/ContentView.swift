//
//  ContentView.swift
//  Edutainment
//
//  Created by iiqrah on 02/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isGameScreenShown = true
    @State private var isSettingsScreenShown = false

    
    @State private var tablesSelected = 2
    
    var questionCountOptions = [5, 10, 20]
    @State private var questionCountSelected = 5
    
    var difficultyOptions = ["Easy", "Medium", "Hard"]
    @State private var difficultySelected = "Easy"
    
    
    @State private var questionCount = 1
    
    @State private var answer = 0


    
    
    var body: some View {
        
        NavigationView{
            
            if isGameScreenShown {
                
                VStack{
                    
                    
                    
                    Text("\(questionCount) / \(questionCountSelected)")
                    
                    Spacer()
                    
                    
                    Text("2 x 5")
                    
                    
                    Spacer()
                    

                    TextField("Answer", value: $answer, format: .number)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    
                    
                    Spacer()

                    
                    
                    HStack{
                        
                        Spacer()
                        
                        Button("Next"){
                            nextQuestion()
                        }
                        
                        Spacer()
                        
                        
                        Button("Restart"){
                            gameSettings()
                        }
                        
                        
                        Spacer()
  
                    }
                    
                    
                    Spacer()
                    
                    
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
                            Picker("Choose number of questions", selection: $questionCountSelected) {
                                ForEach(questionCountOptions, id: \.self) {
                                    Text("\($0)")
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                        }
                        //Text("Number of questions selected \(questionCountSelected)")
                        
                    }
                    
                    
                    Spacer()
                    
                    
                    Section {
                        
                        HStack{
                            Text("Which difficulty level?")
                            Picker("Choose difficulty of questions", selection: $difficultySelected) {
                                ForEach(difficultyOptions, id: \.self) {
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
