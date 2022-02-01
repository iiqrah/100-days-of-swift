//
//  ContentView.swift
//  Drawing
//
//  Created by iiqrah on 19/01/2022.
//

import SwiftUI

struct Triangle: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        
        return path
        
    }
}

struct Arc:InsettableShape{
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    //to make arc conform to InsettableShape
    var insetAmount = 0.0
    
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }

    
    func path(in rect: CGRect) -> Path {
        
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
    
    
        var path = Path()
                
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)


        
        
        
        return path
    }
}

struct ContentView: View {
    var body: some View {
        
        VStack{
            
            Section{
                
                //Path: Fixed and non-reusable
                
                //triangle drawn anti-clockwise
                //CG stands for Core Graphics
                Path { path in
                    path.move(to: CGPoint(x: 50, y: 250))
                    path.addLine(to: CGPoint(x: 150, y: 50))
                    path.addLine(to: CGPoint(x: 250, y: 250))
                    path.addLine(to: CGPoint(x: 50, y: 250))
//Square
//                    path.addLine(to: CGPoint(x: 50, y: 450))
//                    path.addLine(to: CGPoint(x: 250, y: 450))
//                    path.addLine(to: CGPoint(x: 250, y: 250))

                    //make all the lines joint
                    //path.closeSubpath()
                    
                }
                //to fill the shape
                //.fill(.yellow)
                //to stroke the shape
                //.stroke(.blue, lineWidth: 10)
                .stroke(.yellow, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                
                
            }
            
            
            
            Section{
                
                //Shapes: reusability
                
                VStack{
                    
                    HStack{
                        
                        Spacer()
                        
                        
                        Triangle()
                        //.fill(.red)
                        .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))

                        .frame(width: 100, height: 100)
                        
                        
                        Spacer()
                        
                        //Arc
                        Arc(startAngle: .degrees(0), endAngle: .degrees(140), clockwise: true)
                            .stroke(.blue, lineWidth: 10)
                            .frame(width: 100, height: 100)
                        
                        
                        Spacer()
                        
                        
                        
                    }
                    
   
                }
                
                
                
            }
            
            
            Section{
                Spacer()
                
                HStack{
                    
                    Circle()
                        .stroke(.indigo, lineWidth: 30)
                    
                    Circle()
                        .strokeBorder(.purple, lineWidth: 30)
                }
                
                
                
                
                HStack{
                    
                    Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                    
                        .strokeBorder(.green, lineWidth: 30)
                        .frame(width: 200, height: 100)

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
