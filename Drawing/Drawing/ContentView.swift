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

struct ContentView: View {
    var body: some View {
        
        VStack{
            
            Section{
                
                //Path: Fixed and non-reusable
                
                //triangle drawn anti-clockwise
                //CG stands for Core Graphics
                Path { path in
                    path.move(to: CGPoint(x: 100, y: 300))
                    path.addLine(to: CGPoint(x: 200, y: 100))
                    path.addLine(to: CGPoint(x: 300, y: 300))
                    path.addLine(to: CGPoint(x: 100, y: 300))
                    
                    path.addLine(to: CGPoint(x: 100, y: 500))
                    path.addLine(to: CGPoint(x: 300, y: 500))
                    path.addLine(to: CGPoint(x: 300, y: 300))

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
                
                Triangle()
                //.fill(.red)
                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))

                .frame(width: 300, height: 300)
            }
            
            
            
            
            
        }
        
       
        
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
