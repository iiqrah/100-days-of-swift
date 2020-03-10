//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Iqrah Nadeem on 08/03/2020.
//  Copyright © 2020 Iqrah Nadeem. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingResult = false
    @State private var resultMessage = ""
    @State private var userScore = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            
            Color.init(red: 0, green: 0, blue: 0,opacity: 0.85)
            .edgesIgnoringSafeArea(.all)
            
            
            VStack(alignment: .center, spacing: 80){
                Spacer()
                VStack{
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                    .font(.largeTitle)
                    .fontWeight(.black)
                }.foregroundColor(.white)
                .frame(maxWidth: .infinity)
               
               
                
               ForEach (0 ..< 3)
                { flagIndex in
                    Button (action: {
                        self.buttonResult(flagIndex)
                    }){
                        Image(self.countries[flagIndex])
                        .renderingMode(.original)
                        .clipShape(Rectangle())
                            .shadow(color: .black, radius: 25)
                    }
                }
                
                HStack{
                    Text("Your score: \(userScore)")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                Spacer()
                
            }
        }.alert(isPresented: $showingResult){
            
            Alert(
                title: Text(resultMessage),
                message: Text("Your score is \(userScore)"),
                dismissButton: .default(Text("Next Question")){
                    self.nextQuestion()
                }
            
            )
            
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
    }
    
    func nextQuestion(){
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
