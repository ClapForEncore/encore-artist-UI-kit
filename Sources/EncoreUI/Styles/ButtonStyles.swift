//
//  UnityButton.swift
//
//  Created by Ubicolor on 05/04/2022.
//
import SwiftUI

struct UnityButtonStyle_Previews: PreviewProvider {
        
    static var previews: some View {
        VStack {

            Button { } label: {
                Text("UP")
            }.buttonStyle(CursorButtonStyle())
            

        }
}
}

struct CursorButtonStyle: ButtonStyle {

    var color: Color = .encoreNeon
    var transparent = false
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 5) {
            ZStack {
                Circle()
                    .fill(configuration.isPressed ? color : Color.black.opacity(transparent ? 0.2 : 1))
                Circle()
                    .stroke(color, lineWidth: 1.5)
                configuration.label
                    .foregroundColor(configuration.isPressed ? .black : .white)
                    .frame(width: 24, height: 24)
                    .aspectRatio(1, contentMode: .fit)
                    .font(.system(size: 7, weight: .bold))
            }
            .frame(width: 46, height: 46)
        }
    }
}
