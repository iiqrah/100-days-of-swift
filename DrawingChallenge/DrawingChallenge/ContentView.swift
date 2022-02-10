//
//  ContentView.swift
//  DrawingChallenge
//
//  Created by iiqrah on 10/02/2022.
//

import SwiftUI

struct Arrow: Shape{
    
    var arrowWidth: Double = 1.0
    let arrowHeadOffset: Double = 50
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + arrowHeadOffset, y: rect.midY - arrowHeadOffset))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - arrowHeadOffset, y: rect.midY - arrowHeadOffset))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        return path
    }
    
}


struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    var body: some View {
        ZStack {
            
            ForEach(0..<steps) { value in
                
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
                
            }
            
        }
        
    }
    
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    
    @State private var arrowWidth = 5.0
    
    @State private var colorCycle = 0.0
    
    
    var body: some View {
        VStack{
            
            Arrow(arrowWidth: arrowWidth)
                .stroke(.blue, lineWidth: arrowWidth)
            
                .frame(width: 250, height: 250)
            
            
            Spacer()
            
            HStack{
                
                
                Button("Reduce Width") {
                    
                    withAnimation{
                        arrowWidth -= 1.0
                    }
                }
                
                
                
                Spacer()
                
                
                Button("Increase Width") {
                    
                    withAnimation{
                        arrowWidth += 1.0
                    }
                }
                
                
                
            }
            
            Spacer()
            
            VStack {
                ColorCyclingRectangle(amount: colorCycle)
                    .frame(width: 300, height: 300)
                
                Slider(value: $colorCycle)
            }
            
        }
        
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
