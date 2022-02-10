//
//  ContentView.swift
//  Drawing
//
//  Created by iiqrah on 19/01/2022.
//

import SwiftUI

struct Spirograph: Shape {
    let innerRadius: Int
    let outerRadius: Int
    let distance: Int
    let amount: Double
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b

        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }

        return a
    }
    
    
    func path(in rect: CGRect) -> Path {
        let divisor = gcd(innerRadius, outerRadius)
        let outerRadius = Double(self.outerRadius)
        let innerRadius = Double(self.innerRadius)
        let distance = Double(self.distance)
        let difference = innerRadius - outerRadius
        let endPoint = ceil(2 * Double.pi * outerRadius / Double(divisor)) * amount

        var path = Path()

        for theta in stride(from: 0, through: endPoint, by: 0.01) {
            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
            var y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)

            x += rect.width / 2
            y += rect.height / 2

            if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }

        return path
    }
}

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
           AnimatablePair(Double(rows), Double(columns))
        }

        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // figure out how big each row/column needs to be
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)

        // loop over all rows and columns, making alternating squares colored
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    // this square should be colored; add a rectangle here
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)

                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }

        return path
    }
}



struct Trapezoid: Shape {
    var insetAmount: Double
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
}

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()

    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct Flower: Shape{
    
    var petalOffset: Double = -20
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // from 0 - 360 degrees, draw 16 petals in total
        //
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            
            // add it to our main path
            path.addPath(rotatedPetal)
        }
        return path
    }
}

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
    
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    @State private var colorCycle = 0.0
    
    
    @State private var circleAmount = 0.0

    
    @State private var insetAmount = 50.0
    
    
    @State private var rows = 4
    @State private var columns = 4
    
    
    @State private var innerRadius = 125.0
    @State private var outerRadius = 75.0
    @State private var distance = 25.0
    @State private var amount = 1.0
    @State private var hue = 0.6
    
    



    
    var body: some View {
        
//       //Day 43 - Project 9, part 1
//        VStack{
//
//            Section{
//
//                //Path: Fixed and non-reusable
//
//                //triangle drawn anti-clockwise
//                //CG stands for Core Graphics
//                Path { path in
//                    path.move(to: CGPoint(x: 50, y: 250))
//                    path.addLine(to: CGPoint(x: 150, y: 50))
//                    path.addLine(to: CGPoint(x: 250, y: 250))
//                    path.addLine(to: CGPoint(x: 50, y: 250))
////Square
////                    path.addLine(to: CGPoint(x: 50, y: 450))
////                    path.addLine(to: CGPoint(x: 250, y: 450))
////                    path.addLine(to: CGPoint(x: 250, y: 250))
//
//                    //make all the lines joint
//                    //path.closeSubpath()
//
//                }
//                //to fill the shape
//                //.fill(.yellow)
//                //to stroke the shape
//                //.stroke(.blue, lineWidth: 10)
//                .stroke(.yellow, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//
//
//            }
//
//
//
//            Section{
//
//                //Shapes: reusability
//
//                VStack{
//
//                    HStack{
//
//                        Spacer()
//
//
//                        Triangle()
//                        //.fill(.red)
//                        .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//
//                        .frame(width: 100, height: 100)
//
//
//                        Spacer()
//
//                        //Arc
//                        Arc(startAngle: .degrees(0), endAngle: .degrees(140), clockwise: true)
//                            .stroke(.blue, lineWidth: 10)
//                            .frame(width: 100, height: 100)
//
//
//                        Spacer()
//
//
//
//                    }
//
//
//                }
//
//
//
//            }
//
//
//            Section{
//                Spacer()
//
//                HStack{
//
//                    Circle()
//                        .stroke(.indigo, lineWidth: 30)
//
//                    Circle()
//                        .strokeBorder(.purple, lineWidth: 30)
//                }
//
//
//
//
//                HStack{
//
//                    Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
//
//                        .strokeBorder(.green, lineWidth: 30)
//                        .frame(width: 200, height: 100)
//
//                }
//
//
//            }
//
//
//
//
//
//        }
        
//
//        //       //Day 44 - Project 9, part 2
//
//        VStack{
//            Section{
//                VStack {
//                    Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                        .fill(.red, style: FillStyle(eoFill: true))
//
//                    Text("Offset")
//                    Slider(value: $petalOffset, in: -40...40)
//                        .padding([.horizontal, .bottom])
//
//                    Text("Width")
//                    Slider(value: $petalWidth, in: 0...100)
//                        .padding(.horizontal)
//                }
//
//            }
//
//
//            Section{
//
//                HStack{
//
//                    Text("Hello World")
//                        .frame(width: 300, height: 300)
//                        //.background(.red)
//                        //.border(.red, width: 30)
//                        //.background(Image("singapore"))
//                        //.border(ImagePaint(image: Image("singapore"), scale: 0.2), width: 30)
//                        .border(ImagePaint(image: Image("singapore"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
//
//                    Capsule()
//                        .strokeBorder(ImagePaint(image: Image("singapore"), scale: 0.1), lineWidth: 20)
//                        .frame(width: 150, height: 150)
//                }
//            }
//
//
//            Section {
//                VStack {
//                            ColorCyclingCircle(amount: colorCycle)
//                                .frame(width: 300, height: 300)
//
//                            Slider(value: $colorCycle)
//                        }
//            }
//
//        }
        
        
        //Day 45 - Project 9, part 3
//        VStack{
            
//            Section{
//
//
//                ZStack {
//                    Image("singapore")
//
//                    Rectangle()
//                        .fill(.red)
//                        .blendMode(.multiply)
//                }
//                .frame(width: 400, height: 300)
//                .clipped()
//
//
//
//                Image("singapore")
//                        .colorMultiply(.green)
//
//            }
            
            
//            Section{
//
//
//                VStack {
//                            ZStack {
//                                Circle()
//                                    .fill(.red)
//                                    .frame(width: 200 * circleAmount)
//                                    .offset(x: -50, y: -80)
//                                    .blendMode(.screen)
//
//                                Circle()
//                                    .fill(.green)
//                                    .frame(width: 200 * circleAmount)
//                                    .offset(x: 50, y: -80)
//                                    .blendMode(.screen)
//
//                                Circle()
//                                    .fill(.blue)
//                                    .frame(width: 200 * circleAmount)
//                                    .blendMode(.screen)
//                            }
//                            .frame(width: 300, height: 300)
//
//                            Slider(value: $circleAmount)
//                                .padding()
//                        }
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .background(.black)
//
//
//
//
//            }
            
            
//            Section{
//
//                Image("singapore")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 200, height: 200)
//                    .saturation(amount)
//                    .blur(radius: (1 - amount) * 20)
//
//
//                Slider(value: $amount)
//                                .padding()
//
//
//            }
            
//
//            Section{
//
//                Trapezoid(insetAmount: insetAmount)
//                            .frame(width: 200, height: 100)
//                            .onTapGesture {
//                                withAnimation {
//                                    insetAmount = Double.random(in: 10...90)
//                                }
//                            }
//            }
            
//            Section{
//
//                Checkerboard(rows: rows, columns: columns)
//                            .onTapGesture {
//                                withAnimation(.linear(duration: 3)) {
//                                    rows = 8
//                                    columns = 16
//                                }
//                            }
//            }
//
            
            
//
        
        
        //Day 46 - Project 9, part 4
        
        
        Text("Hello")

        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
