//
//  ContentView.swift
//  BrainTrainRPS
//
//  Created by Iqrah Nadeem on 06/04/2020.
//  Copyright © 2020 Iqrah Nadeem. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let choices = ["Rock", "Paper", "Scissors"]
    let outcome = ["Draw", "Win", "Lose"]
    
    @State private var showingResult = false
    @State private var resultMessage = ""
    
    @State private var compChoiceIndex = Int.random(in: 0..<3)
    @State private var compOutcomeIndex = Int.random(in: 0..<3)
    
    @State private var userScore = 0
    @State private var roundCount = 0
    
    var body: some View {
        
        NavigationView{
            
            
            VStack{
                Spacer()
                Text("Round \(roundCount)/10")
                Text("Score: \(userScore)")
                Spacer()
                Text(self.choices[compChoiceIndex])
                Text(self.outcome[compOutcomeIndex])
                Spacer()
                HStack{
                    ForEach (0 ..< 3)
                    { choiceIndex in
                        Button (action: {
                            self.buttonResult(choiceIndex)
                            self.gameComplete()
                            self.nextQuestion()
                        }){
                            Text(self.choices[choiceIndex])
                        }
                    }
                }
                Spacer()
            }
           
            .navigationBarTitle("BrainTrainGame:👊 ✋✌️")
        }
        .alert(isPresented: $showingResult){
            
            Alert(
                title: Text(resultMessage),
                message: Text("Your final score is \(userScore)"),
                dismissButton: .default(Text("Restart")){
                    self.roundCount = 0
                    self.userScore = 0
                }
            )
            
        }
    }
    
    
    func buttonResult(_ buttonTapped: Int){
        
        //+1 for Outcome: Draw
        if (compOutcomeIndex == 0 && buttonTapped == compChoiceIndex)
        {
            userScore+=1
        }
            
        //+1 for Outcome: Win
        else if (compOutcomeIndex == 1)
        {
            if (buttonTapped == 0  && compChoiceIndex == 2)
            {
                userScore+=1
            }
            else if (compChoiceIndex+1 == buttonTapped)
            {
                userScore+=1
            }
        }
        //+1 for Outcome: Lose
        else if (compOutcomeIndex == 2)
        {
            if (buttonTapped == 2  && compChoiceIndex == 0)
            {
                userScore+=1
            }
            else if (buttonTapped+1 ==  compChoiceIndex)
            {
                userScore+=1
            }
        }
        
        else{
            userScore-=1
        }
    }
    
    func gameComplete(){
        roundCount+=1
        
        if (roundCount == 10){
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
