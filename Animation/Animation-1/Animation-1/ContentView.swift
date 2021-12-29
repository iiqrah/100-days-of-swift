//
//  ContentView.swift
//  Animation-1
//
//  Created by iiqrah on 30/12/2021.
//
// Implicit animation: suggested through values that are affected by the state, always have to watch for a value attached to it changing to trigger it
// Animations also become functions of the state, just like the views themselves.

import SwiftUI


struct Redbutton: ViewModifier{
    
    func body(content: Content) -> some View {
        
        content
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            
    }
}


extension View {
    
    func RedbuttonStyle() -> some View {
        
        self.modifier(Redbutton())
    }
}

struct ContentView: View {
    
    @State private var animationScaleAmount = 1.0
    
    var body: some View {
        
        
        //Scale effect with implicit animation applied to this button
        //Every time button tapped -> animationScaleAmount increases by one, gets passed to .scaleEffect and .animation to make it happen
        Button("Tap Me"){
            animationScaleAmount += 1
            //do nothing
        }.RedbuttonStyle()
        .scaleEffect(animationScaleAmount)
        // default is .easeInOut effect
        //.animation(.default, value: animationScaleAmount)
        
        //Other types of animation
        
        //easeOut effect that completes in 2 seconds
        //.delay. .repeatCount, or .repeatForver modifier can be applied to the animation modifer itself
        .animation(.easeOut(duration: 2).repeatCount(3), value: animationScaleAmount)
        
        //interpolatingSpring effect with stiffness and damping (how bouncy it is, lower value means more bouncy)
        //.animation(.interpolatingSpring(stiffness: 100, damping: 1), value: animationScaleAmount)
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
