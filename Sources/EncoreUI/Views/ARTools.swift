//
//  ARTools.swift
//  
//
//  Created by Romain on 19/12/2022.
//

import SwiftUI

struct Drawer: View {
    
    @State private var value: CGFloat = 500
    
    var body: some View {
        
        ZStack {
            Image("livingRoom", bundle: .module)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Color.clear.height(value)
                Text(value.description).font(.largeTitle).foregroundColor(.white)
                ZStack {
                    Color.encoreDark.opacity(0.8)
                    VStack {
                        HStack {
                            Spacer()
                            Capsule().height(5).width(60)
                                .foregroundColor(Color(white: 0.8, opacity: 0.3))
                            Spacer()
                        }
                            .padding()
                            
                                                content
                        
                    }
                }
                
                .cornerRadius(20)
            }
            .gesture(DragGesture(minimumDistance: 0).onChanged({ dragValue in
                value = dragValue.translation.height
                print(dragValue.translation.height)
            }).onEnded({ endValue in
                print("end ", endValue.translation.height)
                withAnimation(.spring()) { snap() }
            })
            )
        }
        .ignoresSafeArea()
    }
    private func snap() {
        if value > 0, value < 300  { value = 150 } else { value = 500 }
    }
    private var content: some View {
        Color.clear
    }
}



struct GenAIView: View {
    
    @State var prompt = ""
    var body: some View {
        ZStack {
            Image("livingRoom", bundle: .module)
                .resizable()
                .ignoresSafeArea()
               
            
            VStack(spacing: 17) {
                Image("genAIdemoPics", bundle: .module)
                Text("Generate an asset with AI").inter(size: 32)
                    .width(220)
                Text("Type In a prompt below and create something special.")
                    .width(270)
                
                TextField("", text: $prompt)
                    .encoreStyle(placeHolder: "Type a prompt")
            }
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
        }
        
    }
}


struct Drawer_Previews: PreviewProvider {
    static var previews: some View {
        GenAIView()
    }
}

