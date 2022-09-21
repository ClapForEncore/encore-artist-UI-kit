//
//  UnityButton.swift
//
//  Created by Ubicolor on 05/04/2022.
//
import SwiftUI

public struct Darker: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .overlay(Color.black.opacity(configuration.isPressed ? 0.3 : 0))
    }
}


public struct ColorButtonStyle: ButtonStyle {
    
    var fontColor: Color = .encoreNeon
    var color: Color = .encoreNeon
    var height: ButtonHeight = .medium
    
    public func makeBody(configuration: Configuration) -> some View {
        
        ZStack {
            color.frame(height: height.rawValue)
            configuration.label
                .font(.system(size: 12, weight: .regular, design: .default))
                .foregroundColor(fontColor)
        }
        .cornerRadius(9)
        .overlay(Color.black.opacity(configuration.isPressed ? 0.3 : 0))
        
    }
}

public struct CursorButtonStyle: ButtonStyle {

    var color: Color = .encoreNeon
    var transparent = false
    
    public func makeBody(configuration: Configuration) -> some View {
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

struct CursorButtonStyle_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            
            Button {
                
            } label: {
                Text("ENCORE")
            }
            .buttonStyle(ColorButtonStyle())

            
            Button { } label: {
                Text("UP")
            }.buttonStyle(CursorButtonStyle())
        }
    }
}
