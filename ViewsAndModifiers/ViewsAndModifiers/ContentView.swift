//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Iqrah Nadeem on 11/03/2020.
//  Copyright © 2020 Iqrah Nadeem. All rights reserved.
//

// SwiftUI uses structs instead of class, better performaces, simpler and functional design

//SwiftUI there is no behidn view and the order of modifier call matters.


import SwiftUI

// Custom ViewModifier with new view structure returning new objects
struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}


// Custom ViewModifier with existing modifiers

// Challenge 1: Create a custom ViewModifier and extension that makes a view have a large, blue font suitable for prominent titles in a view.


struct Challenge1: ViewModifier{
    
    func body(content: Content) -> some View {
        
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}


extension View {
    
    func Challenge1Style() -> some View {
        
        self.modifier(Challenge1())
    }
}






struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}


// View Composition
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}


struct ContentView: View {
    
    @State private var useRedText = false

    var body: some View {
        
        VStack{
            
            Text("Hello World")
            .background(Color.yellow)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            Text("Hello World")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .foregroundColor(useRedText ? .red : .blue)
            
            CapsuleText(text: "Custom Container 1")
            CapsuleText(text: "Custom Container 2")
            
            Text("Challenge Style")
                .Challenge1Style()
            
            Text("This text is using a custom modifier")
            .modifier(Title())
            
            
            Text("This text is using a custom modifier extention and watermark")
            .titleStyle()
            .watermarked(with: "Iqrah")
            
            
            
        }
           
            
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
