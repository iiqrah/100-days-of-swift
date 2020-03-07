//
//  ContentView.swift
//  mass-conversion
//
//  Created by Iqrah Nadeem on 07/03/2020.
//  Copyright © 2020 Iqrah Nadeem. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = ""
    @State private var inputUnitIndex = 0
    @State private var outputUnitIndex = 1
    
    let unitValues = ["g", "kg", "stone", "pound", "ounce"]
    let conversionValues = [1, 1000, 6350.29,453.59,28.35]
    
    var convertToGram : Double {
        
        let inputUnit = unitValues[inputUnitIndex]
        let value = Double(inputValue) ?? 0
        
        switch (inputUnit) {
            case unitValues[1]:
                return value*conversionValues[1]
            case unitValues[2]:
                return value*conversionValues[2]
            case unitValues[3]:
                return value*conversionValues[3]
            case unitValues[2]:
                return value*conversionValues[4]
            default:
                return value*conversionValues[0]
        }
    }
    
    var convertToOutputUnit : Double {
        
        let outputUnit = unitValues[outputUnitIndex]
        let gramValue = convertToGram
        
        switch (outputUnit){
            case unitValues[1]:
                return gramValue/conversionValues[1]
            case unitValues[2]:
                return gramValue/conversionValues[2]
            case unitValues[3]:
                return gramValue/conversionValues[3]
            case unitValues[2]:
                return gramValue/conversionValues[4]
            default:
                return gramValue/conversionValues[0]
        }
    }
    
    var body: some View {
        
        NavigationView{
            
            Form {
                
                //Input Section
                Section(header: Text("Choose your input unit:")){
                    Picker("Input Unit", selection: $inputUnitIndex){
                        
                        ForEach(0 ..< unitValues.count){
                            
                            Text("\(self.unitValues[$0])")
                        }
                    }
                    
                    TextField("Enter Input Value", text: $inputValue).keyboardType(.decimalPad)
                    
                }.pickerStyle(SegmentedPickerStyle())
                
                //Output Section
                Section(header: Text("Choose your output unit:")){
                    
                    Picker("Output Unit", selection: $outputUnitIndex){
                        
                        ForEach(0 ..< unitValues.count){
                            
                            Text("\(self.unitValues[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Text("\(convertToOutputUnit, specifier: "%.5f") \(unitValues[outputUnitIndex])")
                    
                }
            }
            
            .navigationBarTitle("Mass Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
