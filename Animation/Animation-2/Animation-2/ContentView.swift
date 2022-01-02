//
//  ContentView.swift
//  Animation-2
//
//  Created by iiqrah on 30/12/2021.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}


struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var cardDragAmount = CGSize.zero
    @State private var textDragAmount = CGSize.zero
    
    @State private var isShowingSquare = false
    
    @State private var isShowingRed = false

    
    var body: some View {
        
        VStack{
            
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(width: 300, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .offset(cardDragAmount)
                        .gesture(
                            DragGesture()
                                .onChanged { cardDragAmount = $0.translation }
                                .onEnded { _ in
                                    withAnimation{
                                        cardDragAmount = .zero
                                    }
                                }
                        )
                        //.animation(.spring(), value: dragAmount)
        Spacer()
        
        HStack(spacing: 0) {
                    ForEach(0..<letters.count) { num in
                        Text(String(letters[num]))
                            .padding(5)
                            .font(.title)
                            .background(enabled ? .blue : .red)
                            .offset(textDragAmount)
                            .animation(.default.delay(Double(num) / 20), value: textDragAmount)
                    }
                }.gesture(
                    DragGesture()
                        .onChanged { textDragAmount = $0.translation }
                        .onEnded { _ in
                            textDragAmount = .zero
                            enabled.toggle()
                        }
                )
            
        Spacer()
            
            
            VStack {
                        Button("Tap Me") {
                            withAnimation {
                                isShowingSquare.toggle()
                            }
                        }
                
                    if isShowingSquare {
                        Rectangle()
                            .fill(.purple)
                            .frame(width: 200, height: 200)
                            //Scale transition
                            //.transition(.scale)
                            //Asymmetric transition
                            .transition(.asymmetric(insertion: .scale, removal: .opacity))

                    }
                
                }
            
            Spacer()
            
            ZStack{
                
                Rectangle()
                                .fill(.blue)
                                .frame(width: 200, height: 200)


                            if isShowingRed {
                                Rectangle()
                                    .fill(.red)
                                    .frame(width: 200, height: 200)
                                    .transition(.pivot)
                            }
                
            }.onTapGesture {
                withAnimation {
                    isShowingRed.toggle()

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
