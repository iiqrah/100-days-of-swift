//
//  ContentView.swift
//  BillSplit
//
//  Created by Iqrah Nadeem on 04/03/2020.
//  Copyright © 2020 Iqrah Nadeem. All rights reserved.
//
//  Contains the initial user interface (UI) for the program, and is where all the work for this project will be done

import SwiftUI

struct ContentView: View {
    
    @State private var mealCost = ""
    @State private var numberOfPeople = 1
    
    
    @State private var tipPercentIndex = 4
    
    let tipPercentValues = [0, 5, 10, 15, 20]
    
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfPeople+1)
        let tipPercent = Double(tipPercentValues[tipPercentIndex])
        let totalCost = Double(mealCost) ?? 0
        
        let tipValue = (tipPercent/100)*totalCost
        let grandTotal = totalCost + tipValue
        let costPerPerson = grandTotal/peopleCount
        
        return costPerPerson
    }
    
    
    var grandTotal: Double {
        
        let tipPercent = Double(tipPercentValues[tipPercentIndex])
        let totalCost = Double(mealCost) ?? 0
        
        let tipValue = (tipPercent/100)*totalCost
        let grandTotal = totalCost + tipValue
        
        return grandTotal
    }
    
    
    
    //some keyword adds an important restriction
    //it must always be the same kind of view being returned
    var body: some View {
        
        NavigationView{
            
                Form {
                    
                    Section {
                        TextField("Enter your meal cost", text: $mealCost)
                            .keyboardType(.decimalPad)
                        
                    }
                    
                    Section {
                   
                    Picker("Enter number of people", selection: $numberOfPeople){
                        
                        ForEach(1 ..< 100) {
                            if($0 == 1)
                            {
                             Text("\($0) person")
                            }
                            else{
                            Text("\($0) people")
                            }
                        }
                    }
                    
                }
                    
                    Section (header: Text("How much tip do you want to leave?")){
                                   
                           Picker("Tip Percent", selection: $tipPercentIndex){
                               ForEach(0 ..< tipPercentValues.count)
                               {
                                   Text("\(self.tipPercentValues[$0])%")
                               }
                           }.pickerStyle(SegmentedPickerStyle())
                        
                        }
                          
                    Section (header: Text("Total cost inc. tip")) {
                        Text("Your grand total is £\(grandTotal, specifier: "%.2f")")
                                          
                        }
                                           
                   Section (header: Text("Amount per person")) {
                       Text("Each person needs to pay £\(totalPerPerson, specifier: "%.2f")")
                       
                   }
                    
            }
                        
                    
                .navigationBarTitle("BillSplit", displayMode: .inline)
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
