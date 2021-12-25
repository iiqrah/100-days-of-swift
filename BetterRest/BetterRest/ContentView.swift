//
//  ContentView.swift
//  BetterRest
//
//  Created by Iqrah Nadeem on 17/04/2020.
//  Copyright © 2020 Iqrah Nadeem. All rights reserved.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUpTime = defaultWakeTime
    @State private var sleepAmountPreffered = 8.0
    @State private var coffeeAmountConsumed = 1
    
    
    //@State private var alertTitle = ""
    //@State private var alertMessage = ""
    //@State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        
        NavigationView{
            
            Form{
                

                Section (header:
                    Text("When would you like to wake up?")
                    .font(.callout)) {

                DatePicker("Please enter a time", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
                }
                
                
                Section (header:
                    Text("How much sleep would you prefer?")
                    .font(.callout)) {
                
                Stepper("\(sleepAmountPreffered.formatted()) hours", value: $sleepAmountPreffered, in: 4...12, step: 0.25)
                }
 
                Section (header:
                    Text("How much coffee do you drink daily?")
                    .font(.callout)) {
                    
                    Stepper(coffeeAmountConsumed == 1 ? "1 cup" : "\(coffeeAmountConsumed) cups", value: $coffeeAmountConsumed, in: 1...24, step: 1)
                    
                   // Picker("Number of coffee mugs", selection: $coffeeAmountConsumed){
                                                
                  //  ForEach(1..<25)
                  //  {
                  //      if($0 == 1){
                  //          Text("1  mug")
                 //       }
                //        else{
                //        Text("\($0) mugs")
                //        }
                //    }
                //}
                //    .labelsHidden()
                //    .pickerStyle(WheelPickerStyle())
                
                }
                
                Section(header:
                Text("Your ideal bedtime is:")
                .font(.callout)) {
                    Text("\(calculateBedtime())")
                }
                
                
                
     
            }
            
            
            //.alert(alertTitle, isPresented: $showingAlert){
            //    Button("OK"){}
            //} message: {
            //    Text(alertMessage)
            //}
                
            .navigationBarTitle("Better Rest")
            //.toolbar{
            //   Button("Calculate", action: calculateBedtime)
            //}
            
        }
        
    }
    
    
    func calculateBedtime() -> String {
        
        var sleepTimeMessage = ""
        
        do{
            
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            //Extracting wake up time and converting to seconds
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUpTime)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
        
            let prediction = try model.prediction(wake: Double(hour+minute), estimatedSleep: sleepAmountPreffered, coffee: Double(coffeeAmountConsumed))
            
            let sleepTime =  wakeUpTime - prediction.actualSleep
            
            //alertTitle = "Your ideal bedtime is: "
            //alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
            sleepTimeMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
            
            
        }
        catch{
            //alertTitle = "Error"
            //alertMessage = "Sorry, there was some problem calculating your bedtime."
            
            sleepTimeMessage = "Sorry, there was some problem calculating your bedtime."
        }
        
        //showingAlert = true
        return sleepTimeMessage
    
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
