//
//  ContentView.swift
//  BetterRest
//
//  Created by Iqrah Nadeem on 17/04/2020.
//  Copyright © 2020 Iqrah Nadeem. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    @State private var wakeUpTime = defaultWakeTime
    @State private var sleepAmountPreffered = 8.0
    @State private var coffeeAmountConsumed = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        
        NavigationView{
            
            Form{
                Spacer()
                
                VStack(alignment: .leading, spacing: 0) {
                Text("When would you like to wake up?")
                .font(.headline)
                
                DatePicker("Please enter a date", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 0) {
                Text("How much sleep would you prefer?")
                .font(.headline)
                
                Stepper(value: $sleepAmountPreffered, in: 4...12, step: 0.25) {
                Text("\(sleepAmountPreffered, specifier: "%g") hours")
                }
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 0) {
                Text("How much coffee do you drink?")
                .font(.headline)
                
                Stepper(value: $coffeeAmountConsumed, in: 0...24) {
                    if (coffeeAmountConsumed == 1)
                    {
                        Text("1 mug")
                        
                    }
                    else{
                        Text("\(coffeeAmountConsumed) mugs")
                    }
                
                }
                    
                }
                
                
            }
            .alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            
            
            .navigationBarItems(trailing:
                Button(action: calculateBedtime){
                    Text("Calculate")})
                
            .navigationBarTitle("Better Rest")
            
        }
        
    }
    
    
    func calculateBedtime() {
        
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUpTime)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmountPreffered, coffee: Double(coffeeAmountConsumed))

            let sleepTime = wakeUpTime - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short

            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "Your ideal bedtime is…"
        
        } catch {
            
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            
        }
        
        showingAlert = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
