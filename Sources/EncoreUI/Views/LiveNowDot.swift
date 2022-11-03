//
//  SwiftUIView.swift
//  
//
//  Created by Romain on 03/11/2022.
//

import SwiftUI

struct LiveNowDot: View {
    @State private var animate = false
    var body: some View {
        Color(hex: "E6F8AB")
            .frame(width: 14, height: 14)
            .cornerRadius(7)
            .shadow(color: .encoreNeon, radius: animate ? 1 : 12)
            .shadow(color: .encoreNeon, radius: animate ? 6 : 12)
            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animate)
            .onAppear {
                animate = true
            }
    }
}

struct LiveNowDot_previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            LiveNowDot()
        }
    }
}
