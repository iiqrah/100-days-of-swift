//
//  ContentView.swift
//  BillSplit
//
//  Created by Iqrah Nadeem on 04/03/2020.
//  Copyright © 2020 Iqrah Nadeem. All rights reserved.
//
//  Contains the initial user interface (UI) for the program, and is where all the work for this project will be done

// Day 24 Challenge 2: Go back to project 1 and use a conditional modifier to change the total amount text view to red if the user selects a 0% tip.

import SwiftUI

struct ContentView: View {
    
    @State private var mealCost = 0.0
    @State private var numberOfPeople = 2
    
    
    @State private var tipPercentIndex = 4
    
    let tipPercentValues = [0, 5, 10, 15, 20]
    
    @FocusState private var amountIsFocused : Bool
    

    
    var grandTotal: Double {
        
        let tipPercent = Double(tipPercentValues[tipPercentIndex])
        let totalCost = Double(mealCost)
        
        let tipValue = (tipPercent/100)*totalCost
        let grandTotal = totalCost + tipValue
        
        return grandTotal
    }
    
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfPeople)
        let costPerPerson = grandTotal/peopleCount
        
        return costPerPerson
    }
    
    
    
    //some keyword adds an important restriction
    //it must always be the same kind of view being returned
    var body: some View {
        
        NavigationView{
            
            Form {
                    Section (header: Text("What is the cost of the meal?")){
                        TextField("Enter your meal cost", value: $mealCost, format:
                                        .currency (code: Locale.current.currencyCode ?? "GBP"))
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                        
                    }
                    
                    Section (header: Text("How many people are splitting the bill?")){
                        TextField("Enter number of people", value: $numberOfPeople, format: .number)
                            .keyboardType(.numberPad)
                            .focused($amountIsFocused)
                        
                        }
                    
                    Section (header: Text("How much tip do you want to leave?")){
                                   
                           Picker("Tip Percent", selection: $tipPercentIndex){
                               ForEach(0 ..< tipPercentValues.count)
                               {
                                   Text("\(self.tipPercentValues[$0])%")
                               }
                           }.pickerStyle(SegmentedPickerStyle())
                        
                        }
                          
                    Section (header: Text("Your grand total is")) {
                        Text(grandTotal, format:
                                    .currency (code: Locale.current.currencyCode ?? "GBP"))
                            .foregroundColor(tipPercentIndex == 0  ? .red : .black)
                                          
                        }
                                           
                   Section (header: Text("Each person needs to pay")) {
                       Text(totalPerPerson, format:
                                    .currency (code: Locale.current.currencyCode ?? "GBP"))
                        .foregroundColor(tipPercentIndex == 0  ? .red : .black)
                       
                   }
                    
            }
                        
                    
                .navigationBarTitle("BillSplit", displayMode: .inline)
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard){
                        Spacer()
                        Button("Done"){
                            amountIsFocused = false
                        }
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


// Shortcut : Option+Cmd+P resumes canvas
//          : Cmd+R run simulator
