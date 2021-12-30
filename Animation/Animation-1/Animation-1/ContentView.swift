//
//  ContentView.swift
//  Animation-1
//
//  Created by iiqrah on 30/12/2021.
//
// Implicit animation: suggested through values that are affected by the state, always have to watch for a value attached to it changing to trigger it

// Animations also become functions of the state, just like the views themselves.

// Animation can be binded to any data, even booleans because the animation is not inventing any new values for the transition, if you print out the values for button increase animation, it goes from 1.0 to 2.0 rather than 1.0 -> 1.5 -> 2.0, so with this logic animation can be applied to true -> false change as well

// Implicit animation can take places by setting the animation on a view and implicitly animating it with a state change OR setting a change in state and changing the view without the view havin any prior knowledge about the change


// Explicit animation: does not require a particular value or state to change, the animation occurs no matter what as soon as thething it is attached to changes. Usually with withAnimation() function

// Modifier order matters, holds true for animation modifiers as well!

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
    @State private var foreverRippleEffect = 1.0
    
    @State private var animationRotationAmount = 0.0
    
    @State private var animationEnabled = false

    
    var body: some View {
        
        
        VStack{
            
            Spacer()
            
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
            
            
            Spacer()
            
            Button("Tap Me"){
                
                //Explicit animation of rotation when button is pressed
//                withAnimation{
//                    animationRotationAmount+=360
//                }
                
                // withAnimation can also have other animation add ons as parameter:
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)){
                    animationRotationAmount+=360
                }
                
            }.RedbuttonStyle()
            //
            .rotation3DEffect(.degrees(animationRotationAmount), axis: (x: 0, y: 1, z: 0))

            //Cretes a ripple effect as an overlay around the red button when tapped
                .overlay(
                    Circle()
                        .stroke(.red)
                        .scaleEffect(foreverRippleEffect)
                        .opacity(2 - foreverRippleEffect)
                    
                        .animation(
                            .easeOut(duration: 1)
                                .repeatForever(autoreverses: false),
                            value: foreverRippleEffect
                        )
                )
                .onAppear {
                    foreverRippleEffect = 2
                }
            
            
            Button("Tap Me") {
                animationEnabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(animationEnabled ? .blue : .red)
            // animation can also have type of nil to start off with disabled animation
            // multiple animation modifiers can be used with different parameters
            .animation(.default, value: animationEnabled)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: animationEnabled ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: animationEnabled)
        
            
            Spacer()
        }

    }
       
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
