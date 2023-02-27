//
//  ARTools.swift
//  
//
//  Created by Romain on 19/12/2022.
//

import SwiftUI

struct EncoreSlider_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView(.horizontal ) {
                EncoreSlider(value: 0.3)
            }
        }
    }
}

struct EncoreSlider: View {
    
    @State var value: CGFloat = 0.5
    var body: some View {
        HStack(spacing: 5) {
            Text("0").inter(size: 10)
                .foregroundColor(.white)
            
            GeometryReader { geometry in
                ZStack {
                    Color.clear.height(28)
                    Capsule().foregroundColor(.transparentWhite).height(3)
                    Capsule().foregroundColor(.encoreNeon).height(3)
                        .scaleEffect(x: value, anchor: .leading)
                    
                    ZStack {
                        Color.clear
                        ZStack {
                            Color.encoreNeon.cornerRadius(25)
                                .width(28).height(28)
                            Text(Int(value * 100).description)
                                .inter(size: 10)
                        }
                        .position(x: geometry.size.width * value, y: 14)
                    }
                }
                .gesture(DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        self.value = min(max(0, CGFloat(value.location.x / geometry.size.width)), 1)
                    })
                )
            }
            Text("100").inter(size: 10)
                .foregroundColor(.white)
        }
        .height(28)
        .width(150)
    }
}
