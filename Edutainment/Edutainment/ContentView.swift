//
//  ContentView.swift
//  Edutainment
//
//  Created by iiqrah on 02/01/2022.
//

import SwiftUI

struct Question {
    var question: String
    var answer: Int
}

struct ContentView: View {
    
    @State private var isGameScreenShown = false
    @State private var isSettingsScreenShown = false

    
    @State private var tablesSelected = 2
    
    var questionCountOptions = [5, 10, 20]
    @State private var questionCountSelected = 5
    
    var difficultyOptions = ["Easy", "Medium", "Hard"]
    @State private var difficultySelected = "Easy"
    
    
    @State private var questionCount = 1
    
    @State private var answer = 0
    
    @State private var questionArray = [Question]()


    
    
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
                            newGame()
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
        generateQuestions()
        
    }
    
    
    func generateQuestions() {
        
        //tablesSelected, questionCountSelected, difficultySelected
        
        var question = ""
        var answer = 1
        var multiplier = 1
        var multiplierRange = 5
        
        if difficultySelected == "Medium"{multiplierRange = 10}
        
        else if difficultySelected == "Hard"{multiplierRange = 20}
        
        
        for _ in 1...questionCountSelected{
            
            multiplier = Int.random(in: 0...multiplierRange)
            question = "\(tablesSelected) x \(multiplier)"
            answer = tablesSelected * multiplier
            
            let member = Question(question: question, answer: answer)
            
            questionArray.append(member)
        }
        
        
        print(questionArray)
                         
        
    }
    
    
    
    func nextQuestion() {
        

        
    }
    
    func newGame(){
        
        questionArray.removeAll()
   
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
