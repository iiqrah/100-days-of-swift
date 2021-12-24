//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Iqrah Nadeem on 08/03/2020.
//  Copyright © 2020 Iqrah Nadeem. All rights reserved.
//

// Day 24 Challenge 3: Go back to project 2 and create a FlagImage() view that renders one flag image using the specific set of modifiers we had.

import SwiftUI

// View Composition
struct FlagImage: View {
    
    var imageName: String
    
    var body: some View{
        
        Image(imageName)
        .renderingMode(.original)
        .clipShape(Rectangle())
        .shadow(color: .black, radius: 25)
    }
}

struct ContentView: View {
    @State private var showingResult = false
    @State private var resultMessage = ""
    @State private var userScore = 0
    @State private var questionCount = 1
    @State private var reachedQuestionLimit = false
    let questionLimit = 8
    
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            
            // Color.init(red: 0, green: 0, blue: 0,opacity: 0.85)
            RadialGradient(stops: [
                            .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                            .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                        ], center: .top, startRadius: 200, endRadius: 700)
                            .ignoresSafeArea()
            
            
            VStack{
                Spacer()
                Spacer()
                
                VStack{
                    Text("Guess the Flag")
                    Text("\(questionCount) / \(questionLimit)")
                }
                .font(.largeTitle.bold())
                .foregroundColor(.white)
                
                
                
                VStack(spacing: 15){
                    VStack {
                    
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                        
                        
                        
                          ForEach (0 ..< 3)
                           { flagIndex in
                               Button {
                                   buttonResult(flagIndex)
                               } label: {
                               Image(countries[flagIndex])
                                   .renderingMode(.original)
                                   .clipShape(Capsule())
                                   .shadow(radius: 5)
                               }
                           }.alert(resultMessage, isPresented: $reachedQuestionLimit) {
                               Button("Play Again", action: resetGame)
                           } message: {
                               Text("Your final score is \(userScore)")
                           }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    
                    Spacer()
                    
                    Text("Your score: \(userScore)")
                    .font(.title)
                    .foregroundColor(.white)
                    
                    Spacer()
                    
            }.alert(resultMessage, isPresented: $showingResult) {
                Button("Continue", action: nextQuestion)
            } message: {
                Text("Your score is \(userScore)")
            }
                .padding()
                
            }
        }
    }
    
    func buttonResult(_ buttonTapped: Int){
        if (buttonTapped == correctAnswer)
        {
            resultMessage = "Correct"
            userScore+=1
        }
        else{
            resultMessage = "Wrong, that's the flag of \(countries[buttonTapped])"
            userScore-=1
        }
        
        showingResult = true
        
        questionCounter()
    }
    
    func questionCounter(){
        if questionCount == questionLimit{
            showingResult = false
            reachedQuestionLimit = true
        }
    }
    
    func nextQuestion(){
        
        questionCount += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
    }
    
    func resetGame(){
        
        userScore = 0
        questionCount = 0
        nextQuestion()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
