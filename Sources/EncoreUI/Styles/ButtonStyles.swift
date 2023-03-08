//
//  UnityButton.swift
//
//  Created by Romain on 05/04/2022.
//
import SwiftUI

///Turns 30% darker when `isPressed`
public struct Darker: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .overlay(Color.black.opacity(configuration.isPressed ? 0.3 : 0))
    }
}


public struct ColorButtonStyle: ButtonStyle {
    
    var fontColor: Color
    var color: Color
    var height: ButtonHeight
    var border: Bool
    
    public init(fontColor: Color = .encoreDark, color: Color = .white, height: ButtonHeight = .medium, border: Bool = false) {
        self.fontColor = fontColor
        self.color = color
        self.height = height
        self.border = border
    }
    public func makeBody(configuration: Configuration) -> some View {
        
        ZStack {
            
            if border {
                RoundedRectangle(cornerRadius: height == .tiny ? 3 : 9)
                    .stroke(color, lineWidth: height == .tiny ? 1 : 2)
            } else {
                color.frame(height: height.rawValue)
            }
            
            configuration.label
                .if(height == .tiny) { view in
                    view.interMedium(size: 9)
                }
                .if(height != .tiny) { view in
                    view.inter(size: 12)
                }
                .foregroundColor(border ? color : fontColor)
                
        }
        .overlay(Color.black.opacity(configuration.isPressed ? 0.3 : 0))
        .cornerRadius(height == .tiny ? 3 : 9)
        .height(height.rawValue)
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

struct ButtonStyles_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ZStack(alignment: .bottom) {
            Color.black.ignoresSafeArea()
            Image("livingRoom", bundle: .module).resizable().aspectRatio(contentMode: .fit)
            BlackGradient()
            
            VStack {
                HStack {
                    
                    ColorButton(label: "CANCEL",color: .clear, fontColor: .encoreRed, height: .tiny) {
                    }.width(51)
                    Spacer()
                    ColorButton(label: "CONFIRM",color: .encoreGreen, height: .tiny, border: true) {
                    }.width(51)
                }
                ColorButton(label: "CONFIRM", border: true) {
                }
                
                Button { } label: {
                    Text("ENCORE")
                }
                .buttonStyle(ColorButtonStyle(fontColor: Color.black, color: .white, height: .medium))
                .width(120)
                Button { } label: {
                    Image.encoreWordmark
                }
                .buttonStyle(ColorButtonStyle(fontColor: Color.black, color: .white, height: .medium))
                .width(120)
                
                Button { } label: {
                    Text("UP")
                }.buttonStyle(CursorButtonStyle())
            }.padding()
        }
        
        
    }
}
