//
//  ContentView.swift
//  Drawing
//
//  Created by iiqrah on 19/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
