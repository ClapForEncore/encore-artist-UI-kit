//
//  SwiftUIView.swift
//  
//
//  Created by Ubicolor on 11/10/2022.
//

import SwiftUI

struct Throbber: View {
    
    @State private var xOffset: CGFloat = -1
    
    var body: some View {
        
        ZStack {
            Text(xOffset.description)

            Color.encoreNeon.frame(width: 14, height: 14)
                .cornerRadius(7)
                .offset(x: (xOffset) * 20)
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: xOffset)
            Color.encoreNeon.frame(width: 14, height: 14)
                .cornerRadius(7)
                .offset(x: xOffset * 30)
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: xOffset)
                .scaleEffect(xOffset)
            Color.encoreNeon.frame(width: 14, height: 14)
                .cornerRadius(7)
                .offset(x: xOffset * 50)
                .rotationEffect(.degrees(xOffset * 45))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: xOffset)
                .scaleEffect(xOffset)

            Color.encoreNeon.frame(width: 14, height: 14)
                .cornerRadius(7)
                .offset(x: xOffset * 80)
                .scaleEffect(xOffset)

                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: xOffset)
                .rotationEffect(.degrees(xOffset * 90))
        }
        .onAppear {
            withAnimation {
                xOffset = 1
            }
        }
    }
    func getOpacity() -> Double {
        return Double(abs(xOffset) / 2)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Image("livingRoom", bundle: .module)
                .resizable()
            Throbber()
        }
    }
}
