//
//  ColorButton.swift
//  
//
//  Created by Romain on 12/09/2022.
//

import SwiftUI

public enum ButtonHeight: CGFloat {
    case tiny = 20
    case small = 38
    case medium = 50
    case large = 60
    case extraLarge = 128
    
}

struct ColorButton_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Image("livingRoom", bundle: .module).resizable().aspectRatio(contentMode: .fit).ignoresSafeArea()
            BlackGradient()
            VStack(spacing: 8) {
                Spacer()
                HStack {
                    ColorButton(icon: Image.plus,
                                label: "Create New Poll",
                                color: .encoreDark,
                                fontColor: .encoreNeon,
                                height: .extraLarge
                    ) { }
                    Color.clear
                }
                Spacer()
                ColorButton(icon: Image.calendarPerson, label: "Hello", action: { })
                HStack(spacing: 8) {
                    ColorButton(icon: Image.plusCircle,
                                label: "Create New Poll",
                                color: .transparentWhite,
                                fontColor: .white,
                                height: .extraLarge) { }
                    VStack {
                        ColorButton(label: "Can you", action: { })
                        ColorButton(icon: Image.wifi,
                                    label: "Hear me?",
                                    color: .encoreRed,
                                    fontColor: .white,
                                    action: { })
                    }
                }
            }.padding(15)
        }
    }
}

public struct ColorButton: View {
    
    @State var icon: Image?
    @State var label: String
    @State var color: Color
    @State var fontColor: Color
    @State var height: ButtonHeight
    @State var action: () -> Void
    
    public init(icon: Image? = nil, label: String, color: Color = .white, fontColor: Color = .black, height: ButtonHeight = .medium, action: @escaping () -> Void) {
        self.icon = icon
        self.label = label
        self.color = color
        self.fontColor = fontColor
        self.height = height
        self.action = action
    }
    
    public var body: some View {
        
        Button {
            action()
        } label: {
            if height == .extraLarge {
                VStack {
                    icon
                    Text(label)
                        .inter(size: 12)
                        .multilineTextAlignment(.center)
                        .frame(width: 50)
                }
            } else {
                HStack {
                    icon?.resizable()
                        .frame(width: 20, height:20)
                    Text(label)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .buttonStyle(ColorButtonStyle(fontColor: fontColor, color: color, height: height))
        
    }
}


