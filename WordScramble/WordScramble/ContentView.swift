//
//  ContentView.swift
//  WordScramble
//
//  Created by iiqrah on 25/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wordsUsed = [String]()
    @State private var rootWord = ""
    @State private var wordEntered = ""
    
    @State private var score = 0
    
    //Properties to handle error alert
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
 
    var body: some View {
        NavigationView{
                    List {
                        
                        Section{
                            TextField("Enter your new word: ", text: $wordEntered)
                            //Removes the capatalisation of words so it matches addNewWord()
                            .autocapitalization(.none)
                        }
                        
                        Section{
                            ForEach(wordsUsed, id:\.self){ word in
                                HStack{
                                    //Use SF Symbols to get letter count of word added
                                    Image(systemName: "\(word.count).circle")
                                    Text(word)
                                }
                            }
                        }
                        
                        
                    }
                
            .navigationTitle(rootWord)
            .toolbar{
                VStack{
                    Button("New Word", action: startGame)
                    Text("Score: \(score)")
                }
            }

            
            // Modifier listens to when 'Enter' is being pressed to execute function
            .onSubmit(addNewWord)
            
            // Modifier to call a method when view is shown for the first time
            .onAppear(perform: startGame)
            
            .alert(errorTitle, isPresented: $showingError){
                Button("OK", role: .cancel){}
            }message: {
                Text(errorMessage)
            }
               
        }
    }
    
    
    func startGame(){
        
        score = 0
        wordsUsed = [String]()
        //Try to get the file URL
        if let startWordsFileURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            //Try to extract the contents of the file
            if let startWordsFile = try? String(contentsOf: startWordsFileURL){
                
                //Add the contents in an array
                let startWords = startWordsFile.components(separatedBy:"\n")
                
                //Select a word from array at random
                rootWord = startWords.randomElement() ?? "failures"
                return
                
            }
        }
        
        
        //If reached here then some FATAL ERROR occured, terminate app
        fatalError("Could not load file from bundle")
            
        
    }
    
    
    func addNewWord(){
        //lower casing and removing white spaces
        let newWord = wordEntered.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        //gaurding to have at least three character in the word
        guard newWord.count > 2 else {
            wordError(title: "Too Short", message: "Level up and think of three or more letter words!")
            return}
        
        //gaurding to not allow word that is the root word itself
        guard newWord != rootWord else {
            wordError(title: "Too Obvious", message: "You can't just use the word given to you!")
            return}
        
        guard isReal(word: newWord) else{
            wordError(title: "Not Real", message: "Either this word does not exist or you spelt it wrong!")
            return
        }
        
        //gaurding to have only original words allowed
        guard isOriginal(word: newWord) else {
            wordError(title: "Already Used", message: "Think of a new word")
            return
        }
        
        //gaurding to use letters from root word only
        guard isPosible(word: newWord) else {
            wordError(title: "Not Possible", message: "Only use letters from \(rootWord)!")
            return
        }
        
        
        
        withAnimation{
        wordsUsed.insert(newWord, at: 0)
        }
        score += newWord.count
        wordEntered = ""
    }
    
    // List of validations
    
    func isOriginal(word:String) -> Bool{
        //If the array does NOT contain word, then it is true and isOriginal
        !wordsUsed.contains(word)
    }
    
    func isPosible(word:String) -> Bool{
        //Creating copy of root word
        var tempRootWord = rootWord
        
        //Looping through each letter of word entered to get position of that letter in root word, if letter does exist -> remove from root word, else letter not in root word so whole thing invalid and return false
        for letter in word{
            if let letterPos = tempRootWord.firstIndex(of: letter)
            {
                tempRootWord.remove(at: letterPos)
            }
            else{
                return false
            }
        }
    //Loop completes check on all the letters and finally reaches here to return true
    return true
    }
    
    
    func isReal(word:String) -> Bool{
        
        //UITextChecker way of finidng misselled words
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        //If location of missplled word not found in range then spelling correct and return true, if location exists then return false
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title:String, message:String){
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
