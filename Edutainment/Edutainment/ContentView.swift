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
    
    //@State private var isShowingResult = false
    @State private var isCheckAnswerDisabled = false
    @State private var isQuestionLimitReached = false
    
    @State private var isGameScreenShown = false
    @State private var isSettingsScreenShown = false

    
    @State private var tablesSelected = 2
    
    var questionCountOptions = [5, 10, 20]
    @State private var questionCountSelected = 5
    
    var difficultyOptions = ["Easy", "Medium", "Hard"]
    @State private var difficultySelected = "Easy"
    
    
    @State private var questionCount = 1
    
    @State private var answerLabel = ""
    
    var question: String {
        if questionArray.isEmpty || questionNumber >= questionArray.count{
               return "2 x 4"
           } else {
               return questionArray[questionNumber].question
           }
       }
    
    @State private var questionArray = [Question]()
    
    @State private var questionNumber = 0
    
    @State private var resultMessage = ""


    
    
    var body: some View {
        
        NavigationView{
            
            if isGameScreenShown {
                
                VStack{
                    
                    
                    
                    Text("\(questionCount) / \(questionCountSelected)")
                    
                    Spacer()
                    
                    
                    VStack{
                        
                        Spacer()
                        
                        Text("\(question)")
                        
                        
                        Spacer()
                        

                        TextField("Type your answer here", text: $answerLabel)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        
                        
                        Spacer()
                        
                        Text("\(resultMessage)")
                        
                        
                    }
                    
                    
                    
                    Spacer()
                    
                    VStack{
                        
                        Spacer()
                        
                        
                        HStack{
                            
                            Spacer()
                            
                            Button("Check Answer"){
                                checkAnswer(questionNumber)
                            }.disabled(isCheckAnswerDisabled)
                            
                            Spacer()
                            
                            
                            
                            
                            Button("Next Question"){
                                nextQuestion()
                            }
                            
                            
                            Spacer()
      
                        }
                        
                        Spacer()
                        
                        Button("Restart"){
                            newGame()
                            
                        }
                        
                        
                        Spacer()
                        
                        
                        
                    }.alert(resultMessage, isPresented: $isQuestionLimitReached) {
                        Button("Play Again", action: newGame)
                    } message: {
                        Text("Want to practise some more?")
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
        
        
        //print(questionArray)
        //print(questionArray[0])
        //print(questionArray[0].question)
                         
        
    }
    
    
    func checkAnswer(_ questionNumber: Int){
        
        let answer = Int(answerLabel)
        
        if answer == questionArray[questionNumber].answer{
            resultMessage = "Correct!"
            isCheckAnswerDisabled = true
        }
        
        else{
            
            resultMessage = "That's incorrect, try again :)"
            
        }
        
        
        
        
        
        
        
        
    }
    
    
    func questionCounter(){
        if questionCount == questionCountSelected{
            isQuestionLimitReached = true
            resultMessage = "Yay! Done with all questions :)"
        }
    }
    
    
    
    func nextQuestion() {
        answerLabel = ""
        resultMessage = ""
        isCheckAnswerDisabled = false
        questionNumber += 1
        questionCount += 1
        questionCounter()
        
    }
    
    func newGame(){
        isSettingsScreenShown = true
        isGameScreenShown = false
        questionNumber = 0
        questionCount = 1
        questionArray.removeAll()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
