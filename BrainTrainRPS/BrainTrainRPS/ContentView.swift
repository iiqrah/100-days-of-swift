//
//  ContentView.swift
//  BrainTrainRPS
//
//  Created by Iqrah Nadeem on 06/04/2020.
//  Copyright © 2020 Iqrah Nadeem. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let choices = ["👊", "🤚", "✌️"]
    let outcome = ["draw", "win", "lose"]
    let roundLimit = 10
    
    @State private var showingResult = false
    @State private var resultMessage = ""
    
    @State private var compChoiceIndex = Int.random(in: 0..<3)
    @State private var compOutcomeIndex = Int.random(in: 0..<3)
    
    @State private var userScore = 0
    @State private var roundCount = 1
    
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.purple, .mint]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            
                VStack{
                    Spacer()
                    Spacer()
                    
                    VStack{
                        Text("Rock Paper Scissors").font(.largeTitle.bold()).padding()
                        
                        Text("Round: \(roundCount)/10").font(.title)
                        
                    }.padding()
                    
                    
                    VStack {
                        VStack{
                            
                            Text("Bot").padding()
                            Text(choices[compChoiceIndex])
                            .padding()
                            .overlay(
                                Capsule(style: .continuous)
                                    .stroke(lineWidth: 5)
                            )
                           
                        }.font(.largeTitle)
                        
                        
                        
                        VStack{
                            Spacer()
                            Text("You should \(outcome[compOutcomeIndex])")
                            Text("Choose wisely.")
                            Spacer()
                        }.font(.title2)
                        
    
                        VStack{
                            
                            Text("You").padding()
                            
                            HStack{
                                Spacer()
                                ForEach (0 ..< 3)
                                { choiceIndex in
                                    Button (action: {
                                        buttonResult(choiceIndex)
                                        gameComplete()
                                        nextQuestion()
                                    }){
                                        Text(choices[choiceIndex])
                                            .padding()
                                            .overlay(
                                                Capsule(style: .continuous)
                                                    .stroke(lineWidth: 5)
                                            )
                                        
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                        }.font(.largeTitle)
                    }.padding()
                    
                    VStack{
                        Text("\(resultMessage)")
                        Text("Your score: \(userScore)")
                    }
                    .font(.title)
                    
                    
                    Spacer()
                }
        }.foregroundColor(.white)
        .alert(isPresented: $showingResult){
            Alert(
                title: Text("Game Over"),
                message: Text("Your final score is \(userScore)"),
                dismissButton: .default(Text("Restart")){
                    roundCount = 1
                    userScore = 0
                }
            )
            
        }
    }
    
    
    
    func buttonResult(_ buttonTapped: Int){
        
        //+1 for Outcome: Draw
        if (compOutcomeIndex == 0 && buttonTapped == compChoiceIndex)
        {
            userScore+=1
            //resultMessage = "Easy thinking, easy +1 for you!"
        }
            
        //+1 for Outcome: Win
        else if (compOutcomeIndex == 1 && buttonTapped == 0  && compChoiceIndex == 2)
        {
            userScore+=1
            //resultMessage = "Win win situation, won the round and a point."
        }
            
        else if (compOutcomeIndex == 1 && compChoiceIndex+1 == buttonTapped)
        {
            userScore+=1
            //resultMessage = "Wohoo! smart thinking, you get +1"
        }
           
        //+1 for Outcome: Lose
        else if (compOutcomeIndex == 2 && buttonTapped == 2  && compChoiceIndex == 0)
        {
            userScore+=1
            //resultMessage = "Yayy, +1 to you"
        }
            
        else if (compOutcomeIndex == 2 && buttonTapped+1 ==  compChoiceIndex)
        {
            userScore+=1
            //resultMessage = "Nice one, you rightfully lost to gain a point."
        }
            
        else
        {
            userScore-=1
            //resultMessage = "Oops, wrong choice."
        }
    }
    
    
    
    func gameComplete(){
        roundCount+=1
        
        if (roundCount == roundLimit){
            showingResult = true
        }
        
    }
        
    func nextQuestion(){
        compChoiceIndex = Int.random(in: 0..<3)
        compOutcomeIndex = Int.random(in: 0..<3)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
